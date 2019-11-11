// Internal names, which are unfortunately named.
pub mod mvccpb {
    // Proto file: kv.proto
    tonic::include_proto!("mvccpb");
}

pub mod authpb {
    // Proto file: auth.proto
    tonic::include_proto!("authpb");
}

pub mod etcdserver {
    // Proto file: rpc.proto
    tonic::include_proto!("etcdserverpb");
}
