GDPC                  P                                                                         T   res://.godot/exported/133200997/export-10ee2b14ed3c73b7308a09b7f9f06a5a-Scene.scn    ^      �      � 8���w&1 ����0    ,   res://.godot/global_script_class_cache.cfg                 ��Р�8���8~$}P�    D   res://.godot/imported/cone.glb-841a8874bfd92edff5cbb3635e2ffb04.scn P      %/      �>�kh�?z �s�8    D   res://.godot/imported/cone.obj-632dff3badc49bb10dd62bf8fc7c895a.meshp:      	      �m�N5���:����6e�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�G      ^      j,���n�{jV�S    H   res://.godot/imported/splash.png-929ed8a00b89ba36c51789452f874c77.ctex   |      <      �=���AK��M؝��f       res://.godot/uid_cache.bin  p�      �       ��u�-!�����6~�       res://3Drawer.gd        .      ��Mu�!a1�       res://Scene.gd  `P      �      �S&换�u���g�       res://Scene.tscn.remap  P�      b       BSDJ9@jƒX�Q�       res://cone.glb.import   �7      �      *{�6�&'3��p�k�       res://cone.obj.import   �E      '      X�5���Za:J�}a@       res://icon.svg.import   M      K      rD������5c��"C       res://project.binary �      ?      �L�xw`'@F��	��       res://splash.png��      �      �w[߭|݇��g�ŉ       res://splash.png.import `~      �      [n֙8<81g��    list=Array[Dictionary]([])
+�5}	extends Node3D
func line(pos1: Vector3, pos2: Vector3, color = Color.WHITE_SMOKE) -> MeshInstance3D:
	var mesh_instance := MeshInstance3D.new()
	var immediate_mesh := ImmediateMesh.new()
	var material := ORMMaterial3D.new()
	
	mesh_instance.mesh = immediate_mesh
	#mesh_instance.cast_shadow = false

	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINES, material)
	immediate_mesh.surface_add_vertex(pos1)
	immediate_mesh.surface_add_vertex(pos2)
	immediate_mesh.surface_end()	
	
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.albedo_color = color
	
	get_tree().get_root().add_child(mesh_instance)
	
	return mesh_instance
	

func point(pos:Vector3, radius = 0.05, color = Color.WHITE_SMOKE) -> MeshInstance3D:
	var mesh_instance := MeshInstance3D.new()
	var sphere_mesh := SphereMesh.new()
	var material := ORMMaterial3D.new()
		
	mesh_instance.mesh = sphere_mesh
	#mesh_instance.cast_shadow = false
	mesh_instance.position = pos
	
	sphere_mesh.radius = radius
	sphere_mesh.height = radius*2
	sphere_mesh.material = material
	
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.albedo_color = color
	
	get_tree().get_root().add_child(mesh_instance)
	
	return mesh_instance
	
func triangle(pos:Vector3,radius = 0.05,color= Color.WHITE_SMOKE,b = false)-> MeshInstance3D:
	var mesh_instance :MeshInstance3D 
	var cone_mesh := load("res://cone.obj")
	
	
	mesh_instance=get_parent().get_node("cone").duplicate()
	
	
	if abs(pos.x)>0 or abs(pos.y)>0 or abs(pos.z)>0:
		mesh_instance.visible=true
	
	
	
	
	var newMaterial = StandardMaterial3D.new() #Make a new Spatial Material
	newMaterial.shading_mode=BaseMaterial3D.SHADING_MODE_UNSHADED
	newMaterial.albedo_color = color
	mesh_instance.material_override=newMaterial
	
	
	
	
	get_tree().get_root().add_child(mesh_instance)
	mesh_instance.position = Vector3()
	mesh_instance.look_at(pos)
	if pos.y!=0 and pos.z==0 and pos.x==0:
		if pos.y>0:
			mesh_instance.rotation_degrees=Vector3(90,0,0)
		else:
			mesh_instance.rotation_degrees=Vector3(-90,0,0)
		
	mesh_instance.position = pos
	return mesh_instance
��RSRC                     PackedScene            ��������                                            u      resource_local_to_scene    resource_name    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    script    lightmap_size_hint    _blend_shape_names 
   _surfaces    blend_shape_mode    custom_aabb    shadow_mesh 	   _bundled        !   local://StandardMaterial3D_38pdd �
         local://ArrayMesh_m41t8 Z         local://ArrayMesh_so4vl =         local://PackedScene_gxx2k &-         StandardMaterial3D             Material.001                         [h?    [�Y?  �?         ?m      
   ArrayMesh    p            	         format         
   primitive             vertex_data    �        ��  ����G>  ���{���>  ��^�l��9?  ��1�T��5?  ���5�1�T?  ���9�^�l?  ���þ�{?  ����G�  �?  ��   ��{?  ����G>^�l?  ����>1�T?  ���9?�5?  ���5?�9?  ��1�T?��>  ��^�l?��G>  ���{?      ��  �?��G�  ���{?�þ  ��^�l?�9�  ��1�T?�5�  ���5?1�T�  ���9?^�l�  ����>�{�  ����G>  ��  ��   ��{�  ����G�^�l�  ���þ1�T�  ���9��5�  ���5��9�  ��1�T��þ  ��^�l���G�  ���{�      �?   �      vertex_count    !         aabb      ��  ��  �����?   @   @      index_data    t                                    	   	 
   
                                                                                              	  	  
                                       	                                                 index_count    �         lods          w�<   �                     
   
                                                                 
    
    
                         �[�=   `             
   
                                 
                  Շ�>   0                                       ��>                           name       Material.001 q          m      
   ArrayMesh          
   cone_Cone p                     format         
   primitive             vertex_data    �        ��  ����  ����      ��  ����  ���?��G>  ���{���4����G>  ���{���4��x;��>  ��^�l������U���>  ��^�l����J��7�9?  ��1�T�$�$b����9?  ��1�T�$�$�Ș4�5?  ���5���T-]�Ȥ�5?  ���5���T-X��01�T?  ���9�$�	6�w��1�T?  ���9�$�	6��,^�l?  ���þ�ؙ>�f��^�l?  ���þ�ؙ>"��&�{?  ����G���eG�Z��{?  ����G���eG]��  �?  ��   ����P�P��  �?  ��   ����P���{?  ����G>dǙU�E���{?  ����G>dǙUڿ.^�l?  ����>���X�@��^�l?  ����>���X�͑1�T?  ���9?	�%Z�@;�1�T?  ���9?	�%Z��5?  ���5?S��Z��.��5?  ���5?S��Z���9?  ��1�T?�%Zpױ��9?  ��1�T?�%Z0�Q$��>  ��^�l?X��X���>  ��^�l?X��%+��G>  ���{?3��U5��G>  ���{?3��U���3      ��  �?��P����      ��  �?��P���?��G�  ���{?�q�U�����G�  ���{?�q�U��D�þ  ��^�l?f�X�����þ  ��^�l?f�XJ�H�9�  ��1�T?�[%Zb�F��9�  ��1�T?�[%Z��fK�5�  ���5?�R�Z]�5��5�  ���5?�R�ZX�O1�T�  ���9?�I%Z�wD�1�T�  ���9?�I%Z�pS^�l�  ����>fA�X�fm�^�l�  ����>fA�X"� Y�{�  ����G>�8�U�Z��{�  ����G>�8�U]�`  ��  ��   �/�P�Pp�  ��  ��   �/�P�qh�{�  ����G�f*eG�ET��{�  ����G�f*eGڿ�j^�l�  ���þw'�>�@j�^�l�  ���þw'�>��mi1�T�  ���9��%	6�@��1�T�  ���9��%	6��e�5�  ���5�V%T-�����5�  ���5�V%T-��Sa�9�  ��1�T��%$p�M��9�  ��1�T��%$0�[�þ  ��^�l�w'�����þ  ��^�l�w'����T��G�  ���{�f*45�p���G�  ���{�f*4��&L      �?   ���������5?  ���5�:��b]�Ȥ�5?  ���5���%]�Ȥ�5?  ���5�҈`2X��0      ��  �?���m����      ��  �?�hh����      ��  �?��>���?�5�  ���5?SZ�n]�5��5�  ���5?t�I]�5��5�  ���5?JnDX�O      �?   �wƫ�����      �?   �2e^�����      �?   �������      ��  ��+�����      ��  ����*����      ��  ��麡���?      ��  ���J����?�5?  ���5���z&]�Ȥ�5?  ���5�F�6y]�Ȥ�5?  ���5����!X��0      ��  �?��w����      ��  �?�e�n����      ��  �?�]�Q���?      ��  �?������?      ��  �?�g�6���?�5�  ���5?�X�r]�5��5�  ���5?0'�w]�5��5�  ���5?�WPRX�O^�l�  ���þpm�@j�^�l�  ���þ�
�:�@j�^�l�  ���þ�I~M��mi^�l�  ���þ�R�,��mi      �?   �s������      �?   ��@�����      �?   ��\������      �?   ��2[�����      �?   �G������      ��  ����G����      ��  ��W����      ��  ��o��$���?      ��  ����y
���?�5?  ���5���T)]�Ȥ�5?  ���5�a��K]�Ȥ�5?  ���5���)X��0  �?  ��   ���P�P��  �?  ��   ���A��P��  �?  ��   ���.��  �?  ��   �ŭ��  �?  ��   ���S��  �?  ��   �%�91��^�l?  ����>��|�@��^�l?  ����>_��|�@��      ��  �?��)r����      ��  �?fk�p����      ��  �?�^�S���?      ��  �?��.S���?      ��  �?ɋB%���?      ��  �?�U�F���?�5�  ���5?<[�i]�5��5�  ���5?�2�w]�5��5�  ���5?�V�UX�O  ��  ��   �� V~�Pp�  ��  ��   �E�]�Pp�  ��  ��   ��M\S�qh  ��  ��   ��3�D�qh^�l�  ���þ4�U�@j�^�l�  ���þwN�@j��5�  ���5�� K�����5�  ���5��	*�����5�  ���5���� ��Sa�5�  ���5�H\(��Sa�5�  ���5��I@��Sa      �?   ��������      �?   �y������      �?   ���������      �?   �6�p�����      �?   �am������      �?   ��Ct�����      �?   ��˭����      �?   ��#������      �?   �?,,�����      ��  ��O�����      ��  ��L	������>  ��^�l�����U���>  ��^�l�A�>,��U���>  ��^�l��ԄJ��7�5?  ���5��=/]�Ȥ�5?  ���5�]��@]�Ȥ^�l?  ���þ��,E�f��^�l?  ���þ(�]�f��^�l?  ���þk��8"��&^�l?  ���þ#��)"��&  �?  ��   �W�\�P��  �?  ��   �#�qj�P��^�l?  ����>��k�@��^�l?  ����>H��h�@��^�l?  ����>Ͻ�S�͑�5?  ���5?���l��.��5?  ���5?5��z��.���>  ��^�l?L��p��X���>  ��^�l?��8j��X���>  ��^�l?��`O��%+��>  ��^�l?g��Q��%+��>  ��^�l?[�X2��%+��>  ��^�l?3u*9��%+      ��  �?�Ch����      ��  �?�k������þ  ��^�l?�iOv�����þ  ��^�l? Yig�����þ  ��^�l?�h@TJ�H�5�  ���5?�Ovn]�5��5�  ���5?;<t]�5�^�l�  ����>�;�l�fm�^�l�  ����>(�q�fm�^�l�  ����>�K�T"� Y^�l�  ����>_2�D"� Y^�l�  ����>U\~C"� Y  ��  ��   ���z�Pp�  ��  ��   ���b�Pp�^�l�  ���þ�	B^�@j�^�l�  ���þ��D�@j��5�  ���5���?�����5�  ���5��D5�����9�  ��1�T��}2p�M��9�  ��1�T���&p�M��þ  ��^�l�1#����þ  ��^�l�C	����þ  ��^�l��0V���T�þ  ��^�l��-�6���T�þ  ��^�l��
���T�þ  ��^�l�_'���T      �?   �W�h�����      �?   ��͛�����      �?   ���������      �?   ���0�����      �?   ���=�����      �?   ��ȣ�����      �?   ���A�����      �?   �,������      �?   ��mt�����      �?   ��N������      �?   ��?������      �?   ��<X�����      �?   ��������      �?   ��R�����      �?   �c7������      �?   ��,����      �?   �
������      vertex_count    �         attribute_data    �    �>\�?  @?\�?��>��?��K?��?.�>�<?�W?�<?�D�>�?]"b?�?���>,�?�qk?,�?�+�>��?�s?��?���>�|(?^�x?�|(?ք�>~4?kB|?~4?H��>  @?�p}?  @?ք�>��K?kB|?��K?���>�W?^�x?�W?�+�>]"b?�s?]"b?���>�qk?�qk?�qk?�D�>�s?]"b?�s?.�>^�x?�W?^�x?��>kB|?��K?kB|?  �>�p}?  @?�p}?�P>kB|?4?kB|?��!>^�x?�|(?^�x?��=�s?��?�s?bq�=�qk?,�?�qk?ԡN=]"b?�?]"b?8��<�W?�<?�W?@eo<��K?��?��K?�#<  @?\�?  @?@eo<~4?��?~4?8��<�|(?�<?�|(?ԡN=��?�?��?bq�=,�?,�?,�?��=�?��?�?��!>�<?�|(?�<?�P>��?4?��?  �>  @?���>,�?���>,�?�qk?,�?  �>�p}?  �>�p}?  @?�p}?bq�=�qk?bq�=�qk?,�?�qk?  �>  @?  �>  @?  �>  @?  �>\�?  �>\�?  @?\�?  @?\�?���>,�?���>,�?�qk?,�?  �>�p}?  �>�p}?  @?�p}?  @?�p}?  @?�p}?bq�=�qk?bq�=�qk?,�?�qk?8��<�|(?8��<�|(?�<?�|(?�<?�|(?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?  �>\�?  �>\�?  @?\�?  @?\�?���>,�?���>,�?�qk?,�?H��>  @?H��>  @?�p}?  @?�p}?  @?�p}?  @?�p}?  @?���>�W?���>�W?  �>�p}?  �>�p}?  @?�p}?  @?�p}?  @?�p}?  @?�p}?bq�=�qk?bq�=�qk?,�?�qk?�#<  @?�#<  @?\�?  @?\�?  @?8��<�|(?8��<�|(?bq�=,�?bq�=,�?,�?,�?,�?,�?,�?,�?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?  �>\�?  �>\�?.�>�<?.�>�<?�W?�<?���>,�?���>,�?���>�|(?���>�|(?^�x?�|(?^�x?�|(?H��>  @?H��>  @?���>�W?���>�W?^�x?�W?���>�qk?���>�qk?.�>^�x?.�>^�x?�W?^�x?�W?^�x?�W?^�x?�W?^�x?  �>�p}?  �>�p}?��!>^�x?��!>^�x?�|(?^�x?bq�=�qk?bq�=�qk?8��<�W?8��<�W?�<?�W?�<?�W?�<?�W?�#<  @?�#<  @?8��<�|(?8��<�|(?bq�=,�?bq�=,�?��=�?��=�?��!>�<?��!>�<?�|(?�<?�|(?�<?�|(?�<?�|(?�<?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?  �>  @?      aabb      ��  ��  ��   @   @   @      index_data    t     @   @   @   @  
 @ 
  @   @   @   @   @   @   @   @   @   @    @   " @ " $ @ $ & @ & ( @ ( * @ * , @ , . @ . 0 @ 0 2 @ 2 4 @ 4 6 @ 6 8 @ 8 : @ : < @ ?        	                 # ! # ' % ' + ) + / - / 3 1 3 7 5 7 ; 9 ; ? = ?             ' # ' / + / 7 3 7 ? ; ?       / ' / ? 7 ?    ? / < > @ >   @       index_count    �         lods          w�<   �   � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � 5 ; 9 5 � ; � � 5 � 5 1 � � ) � � � � � ! � �  � �  � � � � � � � � 	 � �  � � � � � � � � �    �[�=   `   e i � j l � m r � s t � u z � { } � ~ � � � � � g n k v  | � o h p w  � 9 5 y � � � x q � f �    Շ�>   0   M Q ` R T a U Y b Z \ c ] N d V ^ [ O W S X P _    ��>      A D J E G K H B L F C I    	   material                 name       Material.001 q          s            m         PackedScene    t      	         names "         cone    Node3D    Cone 
   transform    mesh 	   skeleton    MeshInstance3D    	   variants          
�#<            
�#<            
�#<                                  node_count             nodes        ��������       ����                      ����                                conn_count              conns               node_paths              editable_instances              version       m      RSRC�9�)�^�g [remap]

importer="scene"
importer_version=1
type="PackedScene"
uid="uid://dw71kjg1317pf"
path="res://.godot/imported/cone.glb-841a8874bfd92edff5cbb3635e2ffb04.scn"

[deps]

source_file="res://cone.glb"
dest_files=["res://.godot/imported/cone.glb-841a8874bfd92edff5cbb3635e2ffb04.scn"]

[params]

nodes/root_type="Node3D"
nodes/root_name="Scene Root"
nodes/apply_root_scale=true
nodes/root_scale=1.0
meshes/ensure_tangents=true
meshes/generate_lods=true
meshes/create_shadow_meshes=true
meshes/light_baking=1
meshes/lightmap_texel_size=0.2
skins/use_named_skins=true
animation/import=true
animation/fps=30
animation/trimming=false
animation/remove_immutable_tracks=true
import_script/path=""
_subresources={}
gltf/embedded_image_handling=1
VI�ES���~�RSRC                  
   ArrayMesh            ��������                                            	      resource_local_to_scene    resource_name    lightmap_size_hint    _blend_shape_names 
   _surfaces    blend_shape_mode    custom_aabb    shadow_mesh    script           local://ArrayMesh_ccl5x @      
   ArrayMesh                	         format         
   primitive             vertex_data              
�#���������    
�#�
�#<�/�������:�� �
�#<3��8Ӌ�h�z;-_�
�#<�fA�����;�;�
�#<��Ib��ٳ�;ٳ�
�#<S��R^��ݣ;<��
�#<	��[�w}�-_<h�z�
�#<��f�f�Ҽ� <����
�#<d��q�Zh�
�#<    
�#<����P���� <���:
�#<d�3��Z��-_<h�z;
�#<����f��;<�;
�#<	���w��ٳ�;ٳ�;
�#<S�S�^�e��;�;<
�#<�	�b���h�z;-_<
�#<�������:�� <
�#<3�d��r�    
�#<
�#<������������� <
�#<�qd���p�h�z�-_<
�#<f��֥����;<
�#<�[	���M�ٳ�ٳ�;
�#<�RS������;��;
�#<�I��6��-_�h�z;
�#<fA��%k� ����:
�#<�83��T�
�#�    
�#</�  p輱 �����
�#<�8�q���-_�h�z�
�#<fAf�%���;���
�#<�I�[�6;�ٳ�ٳ�
�#<�R�R��.����;�
�#<�[�I�˰�h�z�-_�
�#<ffA�X����:�� �
�#<3��8���3    
�#�
�#<�/���?h�z;-_�
�#<�fAk�%+�;�;�
�#<��Iq�P$ٳ�;ٳ�
�#<S��Rq۬�;<��
�#<	��[��-_<h�z�
�#<��f%ߒ�� <����
�#<d��q��/
�#<    
�#<�����qh�� <���:
�#<d�3����j-_<h�z;
�#<���#�mi�;<�;
�#<	�����eٳ�;ٳ�;
�#<S�S�r�Ra�;�;<
�#<�	�o߮[h�z;-_<
�#<�k��T���:�� <
�#<3�dǿ�'L    
�#<
�#<������?������ <
�#<�qdǰ�_8h�z�-_<
�#<f��J�53���;<
�#<�[	��ȸ/ٳ�ٳ�;
�#<�RS�X��-�;��;
�#<�I��t--_�h�z;
�#<fA�#��/�� ����:
�#<�83�]�@5
�#�    
�#</���?�� �����
�#<�8�q^��J-_�h�z�
�#<fAf#�lP�;���
�#<�I�[��Rٳ�ٳ�
�#<�R�RX�FR���;�
�#<�[�I��FPh�z�-_�
�#<ffAJ��L������ �
�#<�q�8��G������ �
�#<�q�8�䎩      vertex_count    A         attribute_data        �>  @?  �>\�?��>��?-�>�<?�D�>�?���>&�?�+�>��?���>�|(?Ǆ�>y4?H��>  @?Ǆ�>��K?���>�W?�+�>`"b?���>�qk?�D�>�s?-�>]�x?��>cB|?  �>�p}?�P>cB|?��!>]�x?��=�s?.q�=�qk?��N=`"b?d��<�W?,go<��K?
�#<  @?,go<y4?d��<�|(?��N=��?.q�=&�?��=�?��!>�<?��K?��?  @?\�?�W?�<?`"b?�?�qk?&�?�s?��?]�x?�|(?cB|?y4?�p}?  @?cB|?��K?]�x?�W?�s?`"b?�qk?�qk?`"b?�s?�W?]�x?��K?cB|?  @?�p}?y4?cB|?�|(?]�x?��?�s?&�?�qk?�?`"b?�<?�W?��?��K?\�?  @?��?y4?�<?�|(?�?��?&�?&�?��?�?�|(?�<?y4?��?�P>��?      aabb    
�#�
�#�
�#�
ף<
ף<
ף<      index_data    t                                 	   	 
   
                                                                                    ! " " ! # # ! $ $ ! % % ! & & ! ' ' ! ( ( ! ) ) ! * * ! + + ! , , ! - - ! . . ! / / ! 0 0 ! 1 1 ! 2 2 ! 3 3 ! 4 4 ! 5 5 ! 6 6 ! 7 7 ! 8 8 ! 9 9 ! : : ! ; ; ! < < ! = = ! > > ! ?    @   @        index_count    �         name    	   Material       RSRC��@ �[remap]

importer="wavefront_obj"
importer_version=1
type="Mesh"
uid="uid://dam34u2xb3t3l"
path="res://.godot/imported/cone.obj-632dff3badc49bb10dd62bf8fc7c895a.mesh"

[deps]

files=["res://.godot/imported/cone.obj-632dff3badc49bb10dd62bf8fc7c895a.mesh"]

source_file="res://cone.obj"
dest_files=["res://.godot/imported/cone.obj-632dff3badc49bb10dd62bf8fc7c895a.mesh", "res://.godot/imported/cone.obj-632dff3badc49bb10dd62bf8fc7c895a.mesh"]

[params]

generate_tangents=true
scale_mesh=Vector3(1, 1, 1)
offset_mesh=Vector3(0, 0, 0)
optimize_mesh=true
�Y�W�9,� GST2   �  �     ����               ��       &  RIFF  WEBPVP8L  /�����6�$I��J��n�����	  ����l۶m۶m۶m۶߶ͳ�:l�F���{��
�@�s�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�wR|������cp$�c���������������������������������������������������������������������������13@�y�˜ ��'�ezߏ �1�&�\�>L��>O��� �\`!��L��@7`�+5&:�6�1.�����K���q*�D�_�����#�h�K�B�a_���f��Eh���x~�?�`O$���|�7L��#����\���b�޲�����`��V�c<��#z�`�F������
�_���$kjU���K n�k���V#��Zp�]�`��3(&
\h�~.8��(F�io��H�1�,�~�hU�^�d�����3 F3^��Aս	+�0��7&���"w?ւ���xU��7�0��2�.�T�:F�Q�j��l�1�.Ђ}	�c��5�	�#��3�;��W�x5�=[��շ	O-�0;���DҜLX #P+w5a�@���t�]�V'�A��|ѵZ�1���	�
Q�x����	G��HξN�7��U!�'���"Ju<�3g��J��	�Y@�,��NxHh���X%#(��0E$��U^�����*G_���z-� ����"-�dG��T
��R��	���L�L���E����-D� b<�S�@ 搳�a�R�����i�-~	`�վ�҇�Ƌ)�'�h��"`��=�B	�W��	���DRM�	�E�P�|�O>�-��>��h�u����!�"ϱI9@ sH[�0K��j��)xb#��ŔfL-���bJ)��ӏ	'2�8B���+n�@ �����`Z29N'|� �"Шp9�9c�E`��f��1�Єy{q3�9��`%��bJ�A��	��Q�ƞ}��B�>�&l��" �y7�+g��٧	/�x��÷	��b,~~N�#��w�[�c<��\(D#����@��H����@��2/x�
"F���t��{j�����U�҃}� 0�Zp���@#�����tD�2	���6�g!�`?ޫ�Y��ag��g1�����ؾ���TDI�yV$���/��|��ُ2�������������������������������������������������������������������߱�  �[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://b7e2s8dka1cbx"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.svg"
dest_files=["res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
svg/scale=1.0
editor/scale_with_editor_scale=false
editor/convert_colors_with_editor_theme=false
C`��extends Node3D
@onready var drawer = get_node("3Drawer")
const SCALING = 0.1
var ogLines : Array
var lines : Array
var areaLines : Array
var time = 0
var rotateU : bool= false
var rotateW : bool= false
var showArea : bool = false
var u : Vector3 = Vector3()
var w : Vector3 = Vector3()
var originDrawed : bool = false
var rotateScene : bool = false
var rotateSpeed=0.6
var module=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	if rotateScene:
		$center.rotation_degrees.y+=rotateSpeed
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):


	time+=delta
	if !originDrawed:
		drawOrigin()
		originDrawed=true
	clearRedraw()
	
	getValues()
	
	var v = crossProdutct(u,w)
	
	var l1=drawer.line(Vector3(),u,Color.CORNSILK)
	var l2=drawer.line(Vector3(),w,Color.CORNSILK)
	var l3=drawer.line(Vector3(),v,Color.HOT_PINK)
	var point1 = drawer.triangle(v,0.005,Color.HOT_PINK,true)
	var point2 = drawer.triangle(u,0.005,Color.CORNSILK)
	var point3 = drawer.triangle(w,0.005,Color.CORNSILK)
	lines.append(l1)
	lines.append(l2)
	lines.append(l3)
	lines.append(point1)
	lines.append(point2)
	lines.append(point3)
	showCrossProductArea()
	module=sqrt(v.x*v.x/SCALING+v.y*v.y/SCALING+v.z*v.z/SCALING)
	$CanvasLayer/module.text="Module of the cross product : "+str(module)
func showCrossProductArea():
	if showArea:
		var l1=drawer.line(u,u+w,Color.CORNSILK)
		var l2=drawer.line(w,u+w,Color.CORNSILK)
		areaLines.append(l1)
		areaLines.append(l2)
		
func clearRedraw():
	for i in lines:
		i.queue_free()
	lines.clear()
	for i in areaLines:
		i.queue_free()
	areaLines.clear()
	
func drawOrigin():
	var a = drawer.line(Vector3.ZERO,Vector3(SCALING*3,0,0),Color.RED)
	var b = drawer.line(Vector3.ZERO,Vector3(0,SCALING*3,0),Color.BLUE)
	var c = drawer.line(Vector3.ZERO,Vector3(0,0,SCALING*3),Color.GREEN)
	ogLines.append(a)
	ogLines.append(b)
	ogLines.append(c)
	
func getValues():
	if !rotateU:
		$CanvasLayer/u/rotateU.text="Rotate"
		u.x=float($CanvasLayer/u/x.text)*SCALING
		u.z=float($CanvasLayer/u/y.text)*SCALING
		u.y=float($CanvasLayer/u/z.text)*SCALING
	else:
		$CanvasLayer/u/rotateU.text="Stop"
		u.y=0
		u.x=sin(time)*SCALING*2
		u.z=cos(time)*SCALING*2
	if !rotateW:
		$CanvasLayer/w/rotateW.text="Rotate"
		w.x=float($CanvasLayer/w/x.text)*SCALING
		w.z=float($CanvasLayer/w/y.text)*SCALING
		w.y=float($CanvasLayer/w/z.text)*SCALING
	else:
		$CanvasLayer/w/rotateW.text="Stop"
		w.y=0
		w.x=cos(time)*SCALING*2
		w.z=sin(time)*SCALING*2
func crossProdutct(v : Vector3,w: Vector3) -> Vector3:
	return Vector3(v.y*w.z-v.z*w.y,v.z*w.x-v.x*w.z,v.x*w.y-v.y*w.x)

func _on_rotate_u_button_down():
	rotateU = !rotateU


func _on_rotate_w_button_down():
	rotateW=!rotateW


func _on_button_button_down():
	$center/ortCamera.current=!$center/ortCamera.current
	$center/Camera3D2.current=!$center/ortCamera.current
	if $center/ortCamera.current:
		$CanvasLayer/CameraSettings/TextEdit.text="Orthogonal"
	else:
		$CanvasLayer/CameraSettings/TextEdit.text="Prospective"


func _on_show_area_button_down():
	showArea=!showArea


func _on_rotate_button_button_down():
	#$center.rotation_degrees.y=0
	rotateScene=!rotateScene
	$CanvasLayer/rotateButton.text="rotate scene"
	if rotateScene:
		$CanvasLayer/rotateButton.text="stop"

func _on_rotate_button_pressed():
	pass


func _on_reset_rotation_button_down():
	$center.rotation_degrees.y=0
	rotateScene=false
	$CanvasLayer/rotateButton.text="rotate scene"
+�5�1��RSRC                     PackedScene            ��������                                            z      resource_local_to_scene    resource_name    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    script    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    radius    height    radial_segments    rings    is_hemisphere 	   _bundled       Script    res://Scene.gd ��������   Script    res://3Drawer.gd ��������
   ArrayMesh    res://cone.obj 
_��c   !   local://StandardMaterial3D_ksl1i �         local://SphereMesh_60ngl �      !   local://StandardMaterial3D_ayt7t �         local://PackedScene_u1deq 4         StandardMaterial3D                        �?m         SphereMesh    m         StandardMaterial3D    	                ��v?      �?  �?m         PackedScene    y      	         names "   ?      Scene    script    Node3D    3Drawer    Origin 
   transform    material_override    mesh    MeshInstance3D    CanvasLayer    u    offset_left    offset_top    offset_right    offset_bottom    text    Label    x    layout_mode !   theme_override_colors/font_color -   theme_override_colors/font_placeholder_color    placeholder_text 	   TextEdit    y    z    rotateU    scale    Button    w    rotateW    CameraSettings    anchors_preset    anchor_top    anchor_right    anchor_bottom    grow_vertical    metadata/_edit_use_anchors_    Label2    anchor_left    grow_horizontal    module    rotateButton    resetRotation 	   ShowArea    size_flags_horizontal    size_flags_vertical    center 
   ortCamera    projection    current 	   Camera3D 
   Camera3D2    cone    visible    _on_rotate_u_button_down    button_down    _on_rotate_w_button_down    _on_button_button_down    _on_rotate_button_button_down    _on_rotate_button_pressed    pressed    _on_reset_rotation_button_down    _on_show_area_button_down    	   variants    X                         B`e<            B`e<            B`e<                                  ��A   �xA   �B   �)&B      Vector u :              �B     ��     �B     B     �?          �?      x      C     0C         �?      �?      y      3C     bC             �?  �?      z    �6pC   }?ſ   D�C   ��A
   �Ā?�Ā?      rotate    +ǃB   +ǷB      Vector w :     �r��   �qB     0A     C     �B     "C   	   Camera :      �B     OC      B      Orthogonal      ZC     ��     �C      switch
    ����     �?    �<   i�?     (�     VC     ��      Marco Casu                  K�     PA     ��     B      Cross Product Visualizer      �A     nC     hB    ��C      module       A     �C     �B    ��C      rotate scene      qC      reset rotation      |B     :C    ��C     YC            Show CrossProductArea    �5?|��Y� ?    g|c?��>�5�|��Y� ?w��@/�@w��@   �5?�\��i&?    r�j?�(�>�5��\��i&?�l�>�p�>�l�>     �?              �?              �?��@?L�P����>                               node_count             nodes     �  ��������       ����                            ����                           ����                                 	   	   ����                  
   ����                              	                    ����      
                                                              ����      
                                                              ����      
                                                              ����      
                                                        ����                               !       	             ����      
                                                 	             ����      
                                                 	             ����      
                                                 	             ����      
            "            #                                ����      $      %      &      '      (                    ����      
      )            *      +      ,                    ����      
      -      .      /      +      0                    ����      1       2   !   3   "   4      $      5      6      7   #   
      8   $   9                 %   ����	      :   &   2   !   2      ;      <      =      >   '   
      ?                 (   ����      @      A      B      C      D                 )   ����      E      F      G      H      I                 *   ����            F      J      H      K                  +   ����      L      M      N      O   ,   
   -   P      Q                  .   ����               2   /   ����      R   0   :   1   9              2   3   ����      S                  4   ����      T   5   U      V      W             conn_count             conns     1          7   6                     7   8                     7   9                     7   :                     <   ;                     7   =                     7   >                    node_paths              editable_instances              version       m      RSRC]C&*��GST2   �  W     ����               �W         RIFF�  WEBPVP8L�  /��U '  ��cC �$�?��?�;�?@lrT 1�$IR� I�J ̪���_�{f��������������?�{�����������=��蝹֏�ַ?"l�U?�i���~,��b�~�|=J=K���%���%���%?��%?��%��R̒�F�eɫ�Բ��QZY��(�,yo�N��;J%K���%w�RȒ{F�c�]�Ա�Q�Xr�(e,�w�.��=JK���%O�RĒgF�a�S�԰�QZX��()�g���x�� v��=�`�>اOv곁��d`�>دOv�3�=�D`�>طOv��$`�>ؿON�3�3����8�wN꽁�zg��8�wN�=�3{G���8�wN�{'���8�w*�=�z��~���*�g�Z�I��~���*�g���	������*�{���N������*�{����~���*���Z���~��_eT����,�
KjuAR������9����[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://ds4bbal1i078y"
path="res://.godot/imported/splash.png-929ed8a00b89ba36c51789452f874c77.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://splash.png"
dest_files=["res://.godot/imported/splash.png-929ed8a00b89ba36c51789452f874c77.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
[remap]

path="res://.godot/exported/133200997/export-10ee2b14ed3c73b7308a09b7f9f06a5a-Scene.scn"
@GU�Ө�S9ʱP�PNG

   IHDR  �  W   ge��   sRGB ���   gAMA  ���a   	pHYs  �  ��o�d  BIDATx^��[r��@Q;�SFk�/7J�8�d��n�Z?�U�/j��ח��?� @������	 �� ��	 �� ��	 �� ��	|�����|FL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL ���LL Ⱦ����q�7���������n���L��G!y��o�21  21 ���J�mx�m.�y�v������#���mv�?Ą�}����?���j��DĄ���g�
�	�*"�D���	��+"�D��	�wTD�
+.묈�V &\�(�'*\��p�F䞨pEb��f��=Q�JĄi��{���	ӹJD�
3�qՈ�f$&o���f"&kՈ�f &GD�'*�LL��<FT��p:y��01�4"�Qab��Dd�ĄÈ�1D�3�	��s�
Gv#"c� &lND�$*�IL،��AT؃���ȜD�-�	O�k� &�2�&Q�&"k�!&<�-$"����
�>eY�)�G�	��MT�1�?D�ψ
�""�
Qម,ND(D���dQ"D1Y���'QY��,BD8���GL.ND8���CL.JD��\��\��02Q�.1�a&�r=b29af�rb2)�JDe~b2��De^b2	a%�21���2Q���JD�Q��FD�c�2.1����De<br2���8��$"�����D�#*����GT�'&;8��GLv""0Qٟ�lLD`\��1و��<De{b��KT�#&O�Q����\��<OL$"�Q�ub�"��ǉ�D�NT~NL��Q���܈�(Q���DD�g����DD���ʂ1`/+Ge���p��r���p���r٘�0��r���0�+G�21`W���1`VW�ʴ1�*���b""�U��ib""�*f���1`U3Eeؘ���f��p1����ab"" �1*��DD �3RTN��� lc���ǙQ9,&"p�3��{LD�GFe�������.1y�� ��-*{eӘ�F ƶה�ILD`.[G%��+-�ym��k�� ���	 O 21  21  21  21  21  21  21  21  21  21  21  21  21  21  21  21  21  21  21  �/_�R������5    IEND�B`�y�m   S�
�y   res://cone.glb
_��c   res://cone.obj��H�#m@   res://icon.svg|�^z8�Q   res://Scene.tscn���kO7�u   res://splash.pngJ7Tb5ECFG      application/config/name          CrossProductVisualizer     application/run/main_scene         res://Scene.tscn   application/config/features$   "         4.0    Forward Plus        application/boot_splash/bg_color                    �?"   application/boot_splash/show_image             application/boot_splash/image         res://splash.png    application/boot_splash/fullsize             application/config/icon         res://ico.ico   &   application/config/windows_native_icon         res://ico.ico   "   display/window/size/viewport_width         #   display/window/size/viewport_height      �     dotnet/project/assembly_name          CrossProductVisualizer  '   rendering/anti_aliasing/quality/msaa_3d         /   rendering/anti_aliasing/quality/screen_space_aa         k