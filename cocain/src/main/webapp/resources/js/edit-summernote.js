/**
 * 창 크기 고정 summernote..
 */
 $(document).ready(function() {
			 $('#summernote').summernote({
				  height: 300,                 // set editor height
				  minHeight: null,             // set minimum height of editor
				  maxHeight: null,             // set maximum height of editor
				  focus: true,                  // set focus to editable area after initializing summernote
				  disableResize: true,            // Does not work
			      disableResizeEditor: true,      // Does not work either
			      resize: false,
			      toolbar: [
			    	    ['style', ['bold', 'italic', 'underline', 'clear']],
			    	    ['font', ['strikethrough', 'superscript', 'subscript']],
			    	    ['fontsize', ['fontsize']],
			    	    ['color', ['color']],
			    	    ['para', ['ul', 'ol', 'paragraph']],
			    	    ['height', ['height']]
			    	  ]
			       
			      
			      
			 });
			 
	
		}); 