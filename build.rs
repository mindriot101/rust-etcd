fn main() {
    gen_proto();
}

#[cfg(feature = "v3")]
fn gen_proto() {
    // Top level protobuf file, this includes the other files
    let protos = &["proto/rpc.proto"];

    match tonic_build::configure()
        // Do not build the server files, as we are just writing a client
        .build_server(false)
        .compile(protos, &["proto"])
    {
        Ok(_) => {}
        Err(e) => {
            panic!("{}", e);
        }
    }
}

#[cfg(not(feature = "v3"))]
fn gen_proto() {}
