class: Workflow
cwlVersion: v1.0
inputs:
- id: image_wsi
  type: string
- id: locx
  type: int
- id: locy
  type: int
- id: width
  type: int
- id: height
  type: int
- id: output_dir
  type: string
- id: analysis_id
  type: string
- id: case_id
  type: string
- id: subject_id
  type: string
- id: otsu_ratio
  type: double
- id: curv_weight
  type: double
- id: lower_size
  type: double
- id: upper_size
  type: double
- id: kernel_size
  type: double
- id: mpp 
  type: double
- id: declump
  type: string
- id: upper_left_corner
  type: string
- id: tile_size
  type: string
- id: patch_size
  type: string
- id: zip_output
  type: string
- id: out_folder
  type: string
outputs:
  fileout:
    outputSource: curl_post/output_log
    type: File
steps:
  curl_get:
    in:
      image_wsi: image_wsi
      locx: locx
      locy: locy
      width: width
      height: height
    out:
    - output_tile
    run: curl-get-tool.yaml
  segment:
    in:
      input_image: curl_get/output_tile
      output_dir: output_dir
      analysis_id: analysis_id
      case_id: case_id
      subject_id: subject_id
      upper_left_corner: upper_left_corner
      tile_size: tile_size
      patch_size: patch_size
      zip_output: zip_output
      otsu_ratio: otsu_ratio
      curv_weight: curv_weight
      lower_size: lower_size
      upper_size: upper_size
      kernel_size: kernel_size
      mpp: mpp
      declump: declump
    out:
    - zip_output_file
    run: segment-tool.yaml
  curl_post:
    in:
      input_zip: segment/zip_output_file
      case_id: case_id
    out:
    - output_log
    run: curl-post-tool.yaml
