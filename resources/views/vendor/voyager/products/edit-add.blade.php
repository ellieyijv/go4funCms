@php    
    $edit = !is_null($dataTypeContent->getKey());
    $add  = is_null($dataTypeContent->getKey());
    $ltinerary = json_decode($dataTypeContent->ltinerary);
   
@endphp



@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        iframe{
            height:200px !important;
        }
        .mce-statusbar .mce-container-body{
            display:none;
        }

        #container{
            display: flex;
            flex-direction: row;
            width: 100%;
           
        }

        .delete_day{
            margin:30px;
        }

        .participantRow{
            margin: 30px 0;
            position: relative;
        }

        .participantRow input{
            border: 1px solid #eee;
            padding: 5px;
        }
        
        .participantRow .remove{
            position: absolute;
            right:15px;
        }

        #participantTable .duration{
            font-size:14px;
            font-weight:normal;
            color:#76838f;
            padding-left:15px;
        }
        .upload-file-modal{
            position:absolute;
            background-color: #f9f9f9;
            left: 15px;
            z-index: 2;

        }

        h5{
            font-weight: bold;
            color:black;
            font-size:20px;
        }
    </style>

@stop

@section('page_title', __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->display_name_singular)

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
        {{ __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->display_name_singular }}
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content edit-add container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <!-- form start -->
                    <form role="form"
                            class="form-edit-add"
                            action="{{ $edit ? route('voyager.'.$dataType->slug.'.update', $dataTypeContent->getKey()) : route('voyager.'.$dataType->slug.'.store') }}"
                            method="POST" enctype="multipart/form-data">
                        <!-- PUT Method if we are editing -->
                        @if($edit)
                            {{ method_field("PUT") }}
                        @endif

                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}

                        <div class="panel-body">
                            @if (count($errors) > 0)
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                            <!-- Adding / Editing -->
                            @php
                                if(!$edit){
                                    $recommends = [];
                                    $ltinerary =[];
                                }
                               
                                $dataTypeRows = $dataType->{($edit ? 'editRows' : 'addRows' )};
                                //split collection to two part adapting to layout
                                list($overview, $description) = $dataTypeRows->chunk(14);
                            @endphp

                            <div class="form-group col-md-12">
                                <h5>Overview</h5>
                            </div> 
                            @foreach($overview as $row)                    
                                <!-- GET THE DISPLAY OPTIONS -->
                                @php
                                $display_options = $row->details->display ?? NULL;
                                if ($dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')}) {
                                    $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')};
                                }
                                @endphp
                                @if (isset($row->details->legend) && isset($row->details->legend->text))
                                <legend class="text-{{ $row->details->legend->align ?? 'center' }}" style="background-color: {{ $row->details->legend->bgcolor ?? '#f0f0f0' }};padding: 5px;">{{ $row->details->legend->text }}</legend>
                                @endif

                                <div class="form-group @if($row->type == 'hidden') hidden @endif col-md-{{ $display_options->width ?? 3 }} {{ $errors->has($row->field) ? 'has-error' : '' }}" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
                                {{ $row->slugify }}
                                <label class="control-label" for="name">{{ $row->display_name }}</label>
                                @include('voyager::multilingual.input-hidden-bread-edit-add')
                                @if (isset($row->details->view))
                                    @include($row->details->view, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'action' => ($edit ? 'edit' : 'add')])
                                @elseif ($row->type == 'relationship')
                                    @include('voyager::formfields.relationship', ['options' => $row->details])
                                @else
                                    
                                    {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                                @endif

                                @foreach (app('voyager')->afterFormFields($row, $dataType, $dataTypeContent) as $after)
                                    {!! $after->handle($row, $dataType, $dataTypeContent) !!}
                                @endforeach
                                @if ($errors->has($row->field))
                                    @foreach ($errors->get($row->field) as $error)
                                        <span class="help-block">{{ $error }}</span>
                                    @endforeach
                                @endif
                                </div>
                            @endforeach
                            
                            <div class="form-group col-md-6 recommends">
                                
                                <label class="control-label" for="name">Recommended Products(Limit 3)</label>
                                <select class="form-control  recommends_select select2-taggable select2-hidden-accessible" name="recommends_product_belongstomany_products[]" multiple  data-select2-id="20" tabindex="-1" aria-hidden="true">
                                  @foreach($recommends as $recommend)
                                    <option value="{{$recommend->id}}" selected>{{$recommend->product_name}}</option>
                                  @endforeach
                                </select>
                            </div>
                            <!--description part -->
                            <div class="form-group col-md-12" style="border-top: 2px solid #f9f9f9; margin-top:50px;">
                                <h5 style="padding-top:20px">description</h5>
                            </div> 
                            @foreach($description as $row)                    
                                <!-- GET THE DISPLAY OPTIONS -->
                                @php
                                $display_options = $row->details->display ?? NULL;
                                if ($dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')}) {
                                    $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')};
                                }
                                
                                @endphp
                                @if (isset($row->details->legend) && isset($row->details->legend->text))
                                <legend class="text-{{ $row->details->legend->align ?? 'center' }}" style="background-color: {{ $row->details->legend->bgcolor ?? '#f0f0f0' }};padding: 5px;">{{ $row->details->legend->text }}</legend>
                                @endif
                                {{-- add parent row class div --}}
                                @if($row->display_name == 'Flyer')
                                    <div class="row">
                                @endif
                                {{----------}}
                                <div class="form-group @if($row->type == 'hidden') hidden @endif @if($row->type == 'rich_text_box') col-md-{{ $display_options->width ?? 6 }} @else col-md-{{ $display_options->width ?? 4 }}@endif {{ $errors->has($row->field) ? 'has-error' : '' }}" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
                                {{ $row->slugify }}
                                <label class="control-label" for="name">{{ $row->display_name }}</label>
                                @include('voyager::multilingual.input-hidden-bread-edit-add')
                                @if (isset($row->details->view))
                                    @include($row->details->view, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'action' => ($edit ? 'edit' : 'add')])
                                @elseif ($row->type == 'relationship')
                                    @include('voyager::formfields.relationship', ['options' => $row->details])
                                @else
                                    {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                                @endif

                                @foreach (app('voyager')->afterFormFields($row, $dataType, $dataTypeContent) as $after)
                                    {!! $after->handle($row, $dataType, $dataTypeContent) !!}
                                @endforeach
                                @if ($errors->has($row->field))
                                    @foreach ($errors->get($row->field) as $error)
                                        <span class="help-block">{{ $error }}</span>
                                    @endforeach
                                @endif
                                {{-- add parent row class div --}}
                                @if($row->display_name == 'spots')
                                    </div>
                                @endif
                                {{----------}}
                                </div>
                            @endforeach
                            <div class="form-group row" id="participantTable">
                                <h5 class="col-md-12">Ltinerary  <span class="duration"></span></h5>
                                <div id="addButtonRow" class="col-md-12">
                                    <input style="width:30px" class="days-input">
                                    <button class="btn btn-large btn-success add" type="button">Add Days</button>
                                </div>
                                     
                                @if(!empty($ltinerary))
                                     @foreach($ltinerary as $indexKey =>$item) 
                                        <div class="participantRow col-md-6"> 
                                             <p>Day</p>
                                             <input name="ltinerary[{{$indexKey}}][day]" style="width:100%"  type="number" class="the-no-day" value="{{$item->day}}" readonly/>
                                             <p>Ltinerary</p>       
                                             <textarea name="ltinerary[{{$indexKey}}][description]" class="form-control day-description richTextBox" rows="3">{{$item->description}}</textarea>
                                                   
                                            <button class="btn btn-danger remove" type="button">Remove</button>
                                        </div>
                                    @endforeach
                                 @endif
                                                             
                            </div> 
                      
                        </div><!-- panel-body -->
                        
                        <div class="panel-footer">
                            @section('submit-buttons')
                                <button type="submit" class="btn btn-primary save">{{ __('voyager::generic.save') }}</button>
                            @stop
                            @yield('submit-buttons')
                        </div>
                    </form>

                    <iframe id="form_target" name="form_target" style="display:none"></iframe>
                    <form id="my_form" action="{{ route('voyager.upload') }}" target="form_target" method="post"
                            enctype="multipart/form-data" style="width:0;height:0;overflow:hidden">
                        <input name="image" id="upload_file" type="file"
                                 onchange="$('#my_form').submit();this.value='';">
                        <input type="hidden" name="type_slug" id="type_slug" value="{{ $dataType->slug }}">
                        {{ csrf_field() }}
                    </form>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade modal-danger" id="confirm_delete_modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="voyager-warning"></i> {{ __('voyager::generic.are_you_sure') }}</h4>
                </div>

                <div class="modal-body">
                    <h4>{{ __('voyager::generic.are_you_sure_delete') }} '<span class="confirm_delete_name"></span>'</h4>
                </div>

                
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                    <button type="button" class="btn btn-danger" id="confirm_delete">{{ __('voyager::generic.delete_confirm') }}</button>
                </div>
            </div>
        </div>
    </div>
   <!-- End Delete File Modal -->
    <template id="itRow">
        <div class="participantRow col-md-6" >
            <p>Day</p>
            <input name="ltinerary[1][day]"  type="number" class="the-no-day" style="width:100%" readonly/>
            <p>Ltinerary</p>  
            <textarea name="ltinerary[1][description]" class="form-control day-description richTextBox" rows="3"></textarea>
                
            <button class="btn btn-danger remove ml-auto" type="button" >Remove</button>
        </div>
    </template>
  
@stop

@section('javascript')
    <script>
        new Vue({
            el: '#filemanager'
        });
        var params = {};
        var $file;
        var edit = {!! $edit = $edit ?: 0 !!} ;
        
       
        // Initialize tooltip component
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })

        // // Initialize popover component
        // $(function () {
        // $('[data-toggle="popover"]').popover("http://192.168.15.195/admin/media")
        // })
        
        //disable the duration 
        function deleteHandler(tag, isMulti) {
          return function() {
            $file = $(this).siblings(tag);

            params = {
                slug:   '{{ $dataType->slug }}',
                filename:  $file.data('file-name'),
                id:     $file.data('id'),
                field:  $file.parent().data('field-name'),
                multi: isMulti,
                _token: '{{ csrf_token() }}'
            }

            $('.confirm_delete_name').text(params.filename);
            $('#confirm_delete_modal').modal('show');
          };
        }
        
        $('document').ready(function () {           
            $('[name="duration"]').prop('readonly', true);
            $('.toggleswitch').bootstrapToggle();
            $('.side-body input[data-slug-origin]').each(function(i, el) {
                $(el).slugify();
            });
            
            $(".recommends_select").select2({
                minimumInputLength: 2,
                multiple:true,
                ajax: {
                    url: "http://localhost/api/products",
                    dataType: 'json',
                    type: "GET",
                    // quietMillis: 50,
                    processResults: function (data) {
                        var item = data.map(function (obj) {
                            let entity = {};
                            entity.id = obj.id;
                            entity.text = obj.product_name; 
                            return entity;
                        });
                       
                        return  {
                            results: item,
                        }
                    
                    }
                }
            });
         
            $('.form-group').on('click', '.remove-multi-image', deleteHandler('img', true));
            $('.form-group').on('click', '.remove-single-image', deleteHandler('img', false));
            $('.form-group').on('click', '.remove-multi-file', deleteHandler('a', true));
            $('.form-group').on('click', '.remove-single-file', deleteHandler('a', false));

            $('#confirm_delete').on('click', function(){
                $.post('{{ route('voyager.media.remove') }}', params, function (response) {
                    if ( response
                        && response.data
                        && response.data.status
                        && response.data.status == 200 ) {

                        toastr.success(response.data.message);
                        $file.parent().fadeOut(300, function() { $(this).remove(); })
                    } else {
                        toastr.error("Error removing file.");
                    }
                });

                $('#confirm_delete_modal').modal('hide');
            });
            $('[data-toggle="tooltip"]').tooltip();
        });

        //////////////////////////////////////////////////////////
        // added by Ellie
        //////////////////////////////////////////////////////////
        
      
        var template = $("#itRow");
        var node = template.prop('content');
        var row = $(node).find('.participantRow');

        function addRow() {
            row.clone(true, true).appendTo("#participantTable");
        }

        function removeRow(button) {
            button.closest(".participantRow").remove();
            
        }
        //add days event
        $(".add").on('click', function () {    
            var addDays = Number($('.days-input').val());
            if(addDays > 30 ){
                alert("please check your input days");
            }else{
                var i = 0;
                var rowCount = Number($(".participantRow").length);
                var dayNoSelector = '.participantRow:last-child .the-no-day'; 
                var dayDescriptionSelector = '.participantRow:last-child .day-description'
                for(i=0; i<addDays; i+=1){
                        addRow();
                        var rowIndex = rowCount + i +1;
                        $(dayNoSelector).val(rowIndex);
                        $(dayNoSelector).attr("name", "ltinerary["+rowIndex+"][day]");
                        $(dayDescriptionSelector).val('');
                        $(dayDescriptionSelector).attr("name", "ltinerary["+rowIndex+"][description]");
                } 
                reloadTinyMce();
                //update duration value
                var duration = Number($(".participantRow").length)
                $('[name="duration"]').val(duration);
                $('#participantTable .duration').text("Duration: " + duration + " (days)");
            }
        });

        //remove days event
        $('#participantTable').on('click', ".remove", function (event) {     
            removeRow($(this));
        });
    
      
    </script>
@stop
