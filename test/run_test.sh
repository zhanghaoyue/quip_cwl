curl -H "Content-Type: application/json" -X POST -d '{"type" : "order", "data" : { "name" : "segmentation", "workflow" : \
             {"image_wsi" : "TCGA-06-0148-01Z-00-DX1.3b19c82d-c52d-4514-8bf6-5b0f629c18de.svs", \
              "locx" : 14487, "locy" : 14019, "width" : 199, "height" : 192, \
              "output_dir" : "./", "analysis_id" : "seg:r0.9:w0.8:l3:u10:k20:jN", \
              "case_id" : "test1", "subject_id" : "test1", \
              "otsu_ratio" : 0.9, "curv_weight": 0.8, "lower_size": 3, "upper_size": 10, "kernel_size": 10, "mpp": 0.25, "declump": "N", \
              "upper_left_corner" : "14487,14019", "tile_size" : "199,192", "patch_size" : "199,192", \
              "zip_output" : "output.zip", "out_folder" : "./temp"}}}' \
              http://quip-jobs:3000/job 
