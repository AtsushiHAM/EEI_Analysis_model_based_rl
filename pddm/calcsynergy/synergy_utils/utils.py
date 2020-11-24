import numpy as np

def R2():

    return r'R^{{{e:d}}}'.format(e=int(2))

def my_as_si(x, ndp):
    s = '{x:0.{ndp:d}e}'.format(x=x, ndp=ndp)
    m, e = s.split('e')
    return r'\times 10^{{{e:d}}}'.format(e=int(e))

def reshape_into_spt_shape(X_input):
    assert len(X_input.shape) == 3
    trial_num, sample_l, action_dim = X_input.shape

    X_loc = np.expand_dims(X_input[0, :, 0], 0)

    for i in range(1, action_dim, 1):
        X_loc = np.concatenate((X_loc, np.expand_dims(X_input[0, :, i], 0)), axis=1)

    for l in range(1, trial_num, 1):
        X_inner = np.expand_dims(X_input[l, :, 0], 0)
        for i in range(1, action_dim, 1):
            X_inner = np.concatenate((X_inner, np.expand_dims(X_input[l, :, i], 0)), axis=1)

        X_loc = np.concatenate((X_loc, X_inner), axis=0)

    return X_loc


def reshape_into_temporal_shape(X_input):
    assert len(X_input.shape) == 3
    trial_num, sample_l, action_dim = X_input.shape

    X_loc = np.expand_dims(X_input[0, :, 0], -1)

    for i in range(1, action_dim, 1):
        X_loc = np.concatenate((X_loc, np.expand_dims(X_input[0, :, i], -1)), axis=1)

    for l in range(1, trial_num, 1):
        X_inner = np.expand_dims(X_input[l, :, 0], -1)
        for i in range(1, action_dim, 1):
            X_inner = np.concatenate((X_inner, np.expand_dims(X_input[l, :, i], -1)), axis=1)

        X_loc = np.concatenate((X_loc, X_inner), axis=-1)

    return X_loc

def reshape_into_spatial_shape(X_input):
    assert len(X_input.shape) == 3
    trial_num, sample_l, action_dim = X_input.shape

    X_loc = X_input[0, :, :]
    X_loc=np.transpose(X_loc)

    for l in range(1, trial_num, 1):
        X_loc = np.hstack((X_loc,np.transpose(X_input[l, :, :])))

    return X_loc