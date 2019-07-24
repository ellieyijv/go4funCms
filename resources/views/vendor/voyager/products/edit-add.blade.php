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
        /* don't show the empty part of media picker */
        .dd-empty{
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

        .participantRow input{
            width:50px;
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
                                <h5 style="font-weight: bold">OVERVIEW</h5>
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
                                <h5 style="font-weight: bold; padding-top:20px">DESCRIPTION</h5>
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

                                <div class="form-group @if($row->type == 'hidden') hidden @endif col-md-{{ $display_options->width ?? 4 }} {{ $errors->has($row->field) ? 'has-error' : '' }}" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
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
                            <div class="form-group col-md-12" >
                                <h5>Ltinerary </h5>
                                <div id="addButtonRow">
                                    <input style="width:30px" class="days-input">
                                    <button class="btn btn-large btn-success add" type="button">Add Days</button>
                                </div>
                                    <table class="table table-hover" id="participantTable">  
                                        @if(!empty($ltinerary))
                                            @foreach($ltinerary as $item) 
                                                <tr class="participantRow col-md-6"> 
                                                    <td><input name="ltinerary[1][day]" id="" type="number" class="the-no-day" value={{$item->day}} >
                                                    </td>
                                                    <td  width="70%">
                                                        <textarea name="ltinerary[1][description]" class="form-control day-description" rows="3" type="rich_text_box">{{$item->description}}</textarea>
                                                    </td>
                                                    <td><button class="btn btn-danger remove" type="button">Remove</button></td>
                                                </tr>
                                            @endforeach
                                        @endif
                                    </table>                             
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
@stop

@section('javascript')
    <script>
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
            $('[name="duration"]').prop('disabled', true);
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
        // add by Ellie
        //////////////////////////////////////////////////////////
        
      
        var row = $(".participantRow");
        console.log(row);
        function addRow() {
            row.clone(true, true).appendTo("#participantTable");
        }

        function removeRow(button) {
            button.closest("tr").remove();
        }
        //add days event
        $(".add").on('click', function () {    
            var duration = Number($('.days-input').val());
            if(duration > 30 ){
                alert("please check your input days");
            }else{
                var i = 0;
                var rowCount = Number($("#participantTable tr").length);
                var dayNoSelector = '.participantRow:last-child .the-no-day'; 
                var dayDescriptionSelector = '.participantRow:last-child .day-description'
                for(i=0; i<duration; i+=1){
                        addRow();
                        var rowIndex = rowCount + i +1;
                        $(dayNoSelector).val(rowIndex);
                        $(dayNoSelector).attr("name", "ltinerary["+rowIndex+"][day]");
                        $(dayDescriptionSelector).val('');
                        $(dayDescriptionSelector).attr("name", "ltinerary["+rowIndex+"][description]");
                } 
            }
        });

        //remove days event
        $("button.remove").on('click', function () {   
            console.log("remove record");
            removeRow($(this));
        });
       
    </script>
@stop
