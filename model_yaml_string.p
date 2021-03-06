�X8"  class_name: Model
config:
  input_layers:
  - [input_1, 0, 0]
  layers:
  - class_name: InputLayer
    config:
      batch_input_shape: !!python/tuple [null, 160, 320, 3]
      input_dtype: float32
      name: input_1
      sparse: false
    inbound_nodes: []
    name: input_1
  - class_name: Cropping2D
    config:
      batch_input_shape: !!python/tuple
      - null
      - !!python/object:tensorflow.python.framework.tensor_shape.Dimension {_value: 160}
      - !!python/object:tensorflow.python.framework.tensor_shape.Dimension {_value: 320}
      - !!python/object:tensorflow.python.framework.tensor_shape.Dimension {_value: 3}
      cropping: !!python/tuple
      - !!python/tuple [60, 20]
      - !!python/tuple [0, 0]
      input_dtype: float32
      name: cropping2d_1
      trainable: true
    inbound_nodes:
    - - [input_1, 0, 0]
    name: cropping2d_1
  - class_name: Lambda
    config:
      arguments: {}
      batch_input_shape: !!python/tuple
      - null
      - !!python/object:tensorflow.python.framework.tensor_shape.Dimension {_value: 80}
      - !!python/object:tensorflow.python.framework.tensor_shape.Dimension {_value: 320}
      - !!python/object:tensorflow.python.framework.tensor_shape.Dimension {_value: 3}
      function: !!python/tuple ["\xE3\x01\0\0\0\0\0\0\0\x01\0\0\0\x02\0\0\0C\0\0\0\
          s\f\0\0\0|\0\0d\x01\0\x18d\x02\0\eS)\x03Ng\0\0\0\0\0\0`@g\0\0\0\0\0\xE0\
          o@\xA9\0)\x01\xDA\x01xr\x01\0\0\0r\x01\0\0\0\xFA\x1F<ipython-input-10-dbfc0ec30480>\xDA\
          \b<lambda>\x0E\0\0\0s\0\0\0\0", null, null]
      function_type: lambda
      input_dtype: float32
      name: lambda_1
      output_shape: null
      output_shape_type: raw
      trainable: true
    inbound_nodes:
    - - [cropping2d_1, 0, 0]
    name: lambda_1
  - class_name: Convolution2D
    config:
      W_constraint: null
      W_regularizer: null
      activation: linear
      activity_regularizer: null
      b_constraint: null
      b_regularizer: null
      bias: true
      border_mode: valid
      dim_ordering: tf
      init: glorot_uniform
      name: convolution2d_1
      nb_col: 3
      nb_filter: 32
      nb_row: 3
      subsample: !!python/tuple [2, 2]
      trainable: true
    inbound_nodes:
    - - [lambda_1, 0, 0]
    name: convolution2d_1
  - class_name: MaxPooling2D
    config:
      border_mode: same
      dim_ordering: tf
      name: maxpooling2d_1
      pool_size: &id001 !!python/tuple [2, 2]
      strides: *id001
      trainable: true
    inbound_nodes:
    - - [convolution2d_1, 0, 0]
    name: maxpooling2d_1
  - class_name: Activation
    config: {activation: elu, name: activation_1, trainable: true}
    inbound_nodes:
    - - [maxpooling2d_1, 0, 0]
    name: activation_1
  - class_name: BatchNormalization
    config: {axis: 3, beta_regularizer: null, epsilon: 0.001, gamma_regularizer: null,
      mode: 0, momentum: 0.9, name: batchnormalization_1, trainable: true}
    inbound_nodes:
    - - [activation_1, 0, 0]
    name: batchnormalization_1
  - class_name: Convolution2D
    config:
      W_constraint: null
      W_regularizer: null
      activation: linear
      activity_regularizer: null
      b_constraint: null
      b_regularizer: null
      bias: true
      border_mode: same
      dim_ordering: tf
      init: glorot_uniform
      name: convolution2d_3
      nb_col: 1
      nb_filter: 32
      nb_row: 7
      subsample: &id002 !!python/tuple [1, 1]
      trainable: true
    inbound_nodes:
    - - [batchnormalization_1, 0, 0]
    name: convolution2d_3
  - class_name: Activation
    config: {activation: elu, name: activation_2, trainable: true}
    inbound_nodes:
    - - [convolution2d_3, 0, 0]
    name: activation_2
  - class_name: Convolution2D
    config:
      W_constraint: null
      W_regularizer: null
      activation: linear
      activity_regularizer: null
      b_constraint: null
      b_regularizer: null
      bias: true
      border_mode: same
      dim_ordering: tf
      init: glorot_uniform
      name: convolution2d_4
      nb_col: 7
      nb_filter: 32
      nb_row: 1
      subsample: *id002
      trainable: true
    inbound_nodes:
    - - [activation_2, 0, 0]
    name: convolution2d_4
  - class_name: BatchNormalization
    config: {axis: 3, beta_regularizer: null, epsilon: 0.001, gamma_regularizer: null,
      mode: 0, momentum: 0.9, name: batchnormalization_2, trainable: true}
    inbound_nodes:
    - - [convolution2d_4, 0, 0]
    name: batchnormalization_2
  - class_name: Convolution2D
    config:
      W_constraint: null
      W_regularizer: null
      activation: linear
      activity_regularizer: null
      b_constraint: null
      b_regularizer: null
      bias: true
      border_mode: same
      dim_ordering: tf
      init: glorot_uniform
      name: convolution2d_2
      nb_col: 1
      nb_filter: 32
      nb_row: 1
      subsample: *id002
      trainable: true
    inbound_nodes:
    - - [batchnormalization_1, 0, 0]
    name: convolution2d_2
  - class_name: Activation
    config: {activation: elu, name: activation_3, trainable: true}
    inbound_nodes:
    - - [batchnormalization_2, 0, 0]
    name: activation_3
  - class_name: Merge
    config:
      arguments: {}
      concat_axis: -1
      dot_axes: -1
      mode: sum
      mode_type: raw
      name: merge_1
      output_mask: null
      output_mask_type: raw
      output_shape: null
      output_shape_type: raw
    inbound_nodes:
    - - [convolution2d_2, 0, 0]
      - [activation_3, 0, 0]
    name: merge_1
  - class_name: Convolution2D
    config:
      W_constraint: null
      W_regularizer: null
      activation: elu
      activity_regularizer: null
      b_constraint: null
      b_regularizer: null
      bias: true
      border_mode: valid
      dim_ordering: tf
      init: glorot_uniform
      name: convolution2d_5
      nb_col: 3
      nb_filter: 48
      nb_row: 3
      subsample: !!python/tuple [2, 2]
      trainable: true
    inbound_nodes:
    - - [merge_1, 0, 0]
    name: convolution2d_5
  - class_name: Convolution2D
    config:
      W_constraint: null
      W_regularizer: null
      activation: elu
      activity_regularizer: null
      b_constraint: null
      b_regularizer: null
      bias: true
      border_mode: valid
      dim_ordering: tf
      init: glorot_uniform
      name: convolution2d_6
      nb_col: 3
      nb_filter: 64
      nb_row: 3
      subsample: !!python/tuple [2, 2]
      trainable: true
    inbound_nodes:
    - - [convolution2d_5, 0, 0]
    name: convolution2d_6
  - class_name: BatchNormalization
    config: {axis: -1, beta_regularizer: null, epsilon: 0.001, gamma_regularizer: null,
      mode: 0, momentum: 0.9, name: batchnormalization_3, trainable: true}
    inbound_nodes:
    - - [convolution2d_6, 0, 0]
    name: batchnormalization_3
  - class_name: Flatten
    config: {name: flatten_1, trainable: true}
    inbound_nodes:
    - - [batchnormalization_3, 0, 0]
    name: flatten_1
  - class_name: Dropout
    config: {name: dropout_1, p: 0.5, trainable: true}
    inbound_nodes:
    - - [flatten_1, 0, 0]
    name: dropout_1
  - class_name: Dense
    config:
      W_constraint: null
      W_regularizer: null
      activation: elu
      activity_regularizer: null
      b_constraint: null
      b_regularizer: null
      bias: true
      init: glorot_uniform
      input_dim: !!python/object/apply:numpy.core.multiarray.scalar
      - !!python/object/apply:numpy.dtype
        args: [i8, 0, 1]
        state: !!python/tuple [3, <, null, null, null, -1, -1, 0]
      - !!binary |
        ABMAAAAAAAA=
      name: dense_1
      output_dim: 128
      trainable: true
    inbound_nodes:
    - - [dropout_1, 0, 0]
    name: dense_1
  - class_name: Dense
    config: {W_constraint: null, W_regularizer: null, activation: linear, activity_regularizer: null,
      b_constraint: null, b_regularizer: null, bias: true, init: glorot_uniform, input_dim: 128,
      name: dense_2, output_dim: 32, trainable: true}
    inbound_nodes:
    - - [dense_1, 0, 0]
    name: dense_2
  - class_name: Dense
    config: {W_constraint: null, W_regularizer: null, activation: tanh, activity_regularizer: null,
      b_constraint: null, b_regularizer: null, bias: true, init: glorot_uniform, input_dim: 32,
      name: dense_3, output_dim: 2, trainable: true}
    inbound_nodes:
    - - [dense_2, 0, 0]
    name: dense_3
  - class_name: Dense
    config: {W_constraint: null, W_regularizer: null, activation: linear, activity_regularizer: null,
      b_constraint: null, b_regularizer: null, bias: true, init: glorot_uniform, input_dim: 2,
      name: dense_4, output_dim: 2, trainable: true}
    inbound_nodes:
    - - [dense_3, 0, 0]
    name: dense_4
  name: model_1
  output_layers:
  - [dense_4, 0, 0]
keras_version: 1.2.1
q .