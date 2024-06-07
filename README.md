Docker Root: Build Minimum Docker Image with Buildroot
=======================================================

![GitHub License](https://img.shields.io/github/license/qinka/dockerroot)




## Available Platform

Docker Root Base Image [qinka/dockerroot-base](https://hub.docker.com/r/qinka/dockerroot-base)

```
docker pull qinka/dockerroot-base:unstable
```

| Platform      | Tag                                                                                           | Size                                                                                                                 | Note                                                           |
|---------------|-----------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| linux/amd64   | ![Docker Image Version (tag)](https://img.shields.io/docker/v/qinka/dockerroot-base/unstable) | ![ Docker Image Size (tag) ]( https://img.shields.io/docker/image-size/qinka/dockerroot-base/unstable?arch=amd64   ) |                                                                |
| linux/arm64   | ![Docker Image Version (tag)](https://img.shields.io/docker/v/qinka/dockerroot-base/unstable) | ![ Docker Image Size (tag) ]( https://img.shields.io/docker/image-size/qinka/dockerroot-base/unstable?arch=arm64   ) |                                                                |
| linux/riscv64 | ![Docker Image Version (tag)](https://img.shields.io/docker/v/qinka/dockerroot-base/unstable) | ![ Docker Image Size (tag) ]( https://img.shields.io/docker/image-size/qinka/dockerroot-base/unstable?arch=riscv64 ) |                                                                |
| linux/loong64 | ![Docker Image Version (tag)](https://img.shields.io/docker/v/qinka/dockerroot-base/unstable) | ![ Docker Image Size (tag) ]( https://img.shields.io/docker/image-size/qinka/dockerroot-base/unstable?arch=loong   ) | Required [Qinka/buildroot](https://github.com/qinka/buildroot) |
| linux/s390x   | ![Docker Image Version (tag)](https://img.shields.io/docker/v/qinka/dockerroot-base/unstable) | ![ Docker Image Size (tag) ]( https://img.shields.io/docker/image-size/qinka/dockerroot-base/unstable?arch=s390x   ) |                                                                |

## Build

Copy a debian image for loongarch and change `debian-port` mirror.
```
make sync-loong-debian
```
Mix a debian image
```
make base-debian-image
```
Create image to build buildroot rootfs
```
make BUILDROOT_DOWNLOAD_URL=https://gitee.com/Qinka/buildroot/repository/archive/master.tar.gz BUILDROOT_TAG=unstable image-buildroot
```
Create base root
```
make BUILDROOT_IMAGE=qinka/buildroot BUILDROOT_TAG=unstable DOCKERROOT_IMAGE=qinka/dockerroot DOCKERROOT_TAG=unstable image-dockerroot-base
```


## Buildroot Image

[qinka/buildroot](https://hub.docker.com/r/qinka/buildroot) is an image to build rootfs. [qinka/dockerroot](https://github.com/qinka/dockerroot) is in `/usr/src/buildroot`.

[qinka/dockerroot](https://github.com/qinka/dockerroot) includes patches for loongarch64.


## Image Content

```
/
├── bin
├── dev
├── etc
│   ├── hosts
│   ├── nsswitch.conf
│   ├── os-release -> ../usr/lib/os-release
│   └── ssl
│       └── certs
│           ├── 002c0b4f.0 -> GlobalSign_Root_R46.pem
│           ├── 02265526.0 -> Entrust_Root_Certification_Authority_-_G2.pem
│           ├── 062cdee6.0 -> GlobalSign_Root_CA_-_R3.pem
│           ├── 064e0aa9.0 -> QuoVadis_Root_CA_2_G3.pem
│           ├── 06dc52d5.0 -> SSL.com_EV_Root_Certification_Authority_RSA_R2.pem
│           ├── 08063a00.0 -> Security_Communication_RootCA3.pem
│           ├── 09789157.0 -> Starfield_Services_Root_Certificate_Authority_-_G2.pem
│           ├── 0a775a30.0 -> GTS_Root_R3.pem
│           ├── 0b1b94ef.0 -> CFCA_EV_ROOT.pem
│           ├── 0b9bc432.0 -> ISRG_Root_X2.pem
│           ├── 0bf05006.0 -> SSL.com_Root_Certification_Authority_ECC.pem
│           ├── 0f5dc4f3.0 -> UCA_Extended_Validation_Root.pem
│           ├── 0f6fa695.0 -> GDCA_TrustAUTH_R5_ROOT.pem
│           ├── 1001acf7.0 -> GTS_Root_R1.pem
│           ├── 106f3e4d.0 -> Entrust_Root_Certification_Authority_-_EC1.pem
│           ├── 14bc7599.0 -> emSign_ECC_Root_CA_-_G3.pem
│           ├── 18856ac4.0 -> SecureSign_RootCA11.pem
│           ├── 1d3472b9.0 -> GlobalSign_ECC_Root_CA_-_R5.pem
│           ├── 1e08bfd1.0 -> IdenTrust_Public_Sector_Root_CA_1.pem
│           ├── 1e09d511.0 -> T-TeleSec_GlobalRoot_Class_2.pem
│           ├── 244b5494.0 -> DigiCert_High_Assurance_EV_Root_CA.pem
│           ├── 2923b3f9.0 -> emSign_Root_CA_-_G1.pem
│           ├── 2ae6433e.0 -> CA_Disig_Root_R2.pem
│           ├── 2b349938.0 -> AffirmTrust_Commercial.pem
│           ├── 32888f65.0 -> Hellenic_Academic_and_Research_Institutions_RootCA_2015.pem
│           ├── 3513523f.0 -> DigiCert_Global_Root_CA.pem
│           ├── 3bde41ac.0 -> Autoridad_de_Certificacion_Firmaprofesional_CIF_A62634068.pem
│           ├── 3bde41ac.1 -> Autoridad_de_Certificacion_Firmaprofesional_CIF_A62634068_2.pem
│           ├── 3e44d2f7.0 -> TrustCor_RootCert_CA-2.pem
│           ├── 3e45d192.0 -> Hongkong_Post_Root_CA_1.pem
│           ├── 3fb36b73.0 -> NAVER_Global_Root_Certification_Authority.pem
│           ├── 40193066.0 -> Certum_Trusted_Network_CA_2.pem
│           ├── 4042bcee.0 -> ISRG_Root_X1.pem
│           ├── 40547a79.0 -> COMODO_Certification_Authority.pem
│           ├── 406c9bb1.0 -> emSign_Root_CA_-_C1.pem
│           ├── 48bec511.0 -> Certum_Trusted_Network_CA.pem
│           ├── 4b718d9b.0 -> emSign_ECC_Root_CA_-_C3.pem
│           ├── 4bfab552.0 -> Starfield_Root_Certificate_Authority_-_G2.pem
│           ├── 4f316efb.0 -> SwissSign_Gold_CA_-_G2.pem
│           ├── 5273a94c.0 -> E-Tugra_Certification_Authority.pem
│           ├── 5443e9e3.0 -> T-TeleSec_GlobalRoot_Class_3.pem
│           ├── 54657681.0 -> Buypass_Class_2_Root_CA.pem
│           ├── 57bcb2da.0 -> SwissSign_Silver_CA_-_G2.pem
│           ├── 5860aaa6.0 -> Security_Communication_ECC_RootCA1.pem
│           ├── 5931b5bc.0 -> D-TRUST_EV_Root_CA_1_2020.pem
│           ├── 5a7722fb.0 -> E-Tugra_Global_Root_CA_ECC_v3.pem
│           ├── 5ad8a5d6.0 -> GlobalSign_Root_CA.pem
│           ├── 5cd81ad7.0 -> TeliaSonera_Root_CA_v1.pem
│           ├── 5d3033c5.0 -> TrustCor_RootCert_CA-1.pem
│           ├── 5e98733a.0 -> Entrust_Root_Certification_Authority_-_G4.pem
│           ├── 5f15c80c.0 -> TWCA_Global_Root_CA.pem
│           ├── 5f618aec.0 -> certSIGN_Root_CA_G2.pem
│           ├── 607986c7.0 -> DigiCert_Global_Root_G2.pem
│           ├── 626dceaf.0 -> GTS_Root_R2.pem
│           ├── 653b494a.0 -> Baltimore_CyberTrust_Root.pem
│           ├── 66445960.0 -> E-Tugra_Global_Root_CA_RSA_v3.pem
│           ├── 68dd7389.0 -> Hongkong_Post_Root_CA_3.pem
│           ├── 6b99d060.0 -> Entrust_Root_Certification_Authority.pem
│           ├── 6d41d539.0 -> Amazon_Root_CA_2.pem
│           ├── 6fa5da56.0 -> SSL.com_Root_Certification_Authority_RSA.pem
│           ├── 706f604c.0 -> XRamp_Global_CA_Root.pem
│           ├── 749e9e03.0 -> QuoVadis_Root_CA_1_G3.pem
│           ├── 75d1b2ed.0 -> DigiCert_Trusted_Root_G4.pem
│           ├── 76faf6c0.0 -> QuoVadis_Root_CA_3.pem
│           ├── 7719f463.0 -> Hellenic_Academic_and_Research_Institutions_ECC_RootCA_2015.pem
│           ├── 773e07ad.0 -> OISTE_WISeKey_Global_Root_GC_CA.pem
│           ├── 7a3adc42.0 -> vTrus_Root_CA.pem
│           ├── 7a780d93.0 -> Certainly_Root_R1.pem
│           ├── 7aaf71c0.0 -> TrustCor_ECA-1.pem
│           ├── 7f3d5d1d.0 -> DigiCert_Assured_ID_Root_G3.pem
│           ├── 8160b96c.0 -> Microsec_e-Szigno_Root_CA_2009.pem
│           ├── 8508e720.0 -> Certainly_Root_E1.pem
│           ├── 8cb5ee0f.0 -> Amazon_Root_CA_3.pem
│           ├── 8d86cdd1.0 -> certSIGN_ROOT_CA.pem
│           ├── 8d89cda1.0 -> Microsoft_ECC_Root_Certificate_Authority_2017.pem
│           ├── 8f103249.0 -> Telia_Root_CA_v2.pem
│           ├── 90c5a3c8.0 -> HiPKI_Root_CA_-_G1.pem
│           ├── 930ac5d2.0 -> Actalis_Authentication_Root_CA.pem
│           ├── 93bc0acc.0 -> AffirmTrust_Networking.pem
│           ├── 9482e63a.0 -> Certum_EC-384_CA.pem
│           ├── 9846683b.0 -> DigiCert_TLS_ECC_P384_Root_G5.pem
│           ├── 988a38cb.0 -> NetLock_Arany_=Class_Gold=_Főtanúsítvány.pem
│           ├── 9b5697b0.0 -> Trustwave_Global_ECC_P256_Certification_Authority.pem
│           ├── 9c8dfbd4.0 -> AffirmTrust_Premium_ECC.pem
│           ├── 9d04f354.0 -> DigiCert_Assured_ID_Root_G2.pem
│           ├── 9ef4a08a.0 -> D-TRUST_BR_Root_CA_1_2020.pem
│           ├── 9f727ac7.0 -> HARICA_TLS_RSA_Root_CA_2021.pem
│           ├── a3418fda.0 -> GTS_Root_R4.pem
│           ├── a94d09e5.0 -> ACCVRAIZ1.pem
│           ├── ACCVRAIZ1.pem -> ../../../usr/share/ca-certificates/mozilla/ACCVRAIZ1.crt
│           ├── AC_RAIZ_FNMT-RCM.pem -> ../../../usr/share/ca-certificates/mozilla/AC_RAIZ_FNMT-RCM.crt
│           ├── AC_RAIZ_FNMT-RCM_SERVIDORES_SEGUROS.pem -> ../../../usr/share/ca-certificates/mozilla/AC_RAIZ_FNMT-RCM_SERVIDORES_SEGUROS.crt
│           ├── Actalis_Authentication_Root_CA.pem -> ../../../usr/share/ca-certificates/mozilla/Actalis_Authentication_Root_CA.crt
│           ├── aee5f10d.0 -> Entrust.net_Premium_2048_Secure_Server_CA.pem
│           ├── AffirmTrust_Commercial.pem -> ../../../usr/share/ca-certificates/mozilla/AffirmTrust_Commercial.crt
│           ├── AffirmTrust_Networking.pem -> ../../../usr/share/ca-certificates/mozilla/AffirmTrust_Networking.crt
│           ├── AffirmTrust_Premium_ECC.pem -> ../../../usr/share/ca-certificates/mozilla/AffirmTrust_Premium_ECC.crt
│           ├── AffirmTrust_Premium.pem -> ../../../usr/share/ca-certificates/mozilla/AffirmTrust_Premium.crt
│           ├── Amazon_Root_CA_1.pem -> ../../../usr/share/ca-certificates/mozilla/Amazon_Root_CA_1.crt
│           ├── Amazon_Root_CA_2.pem -> ../../../usr/share/ca-certificates/mozilla/Amazon_Root_CA_2.crt
│           ├── Amazon_Root_CA_3.pem -> ../../../usr/share/ca-certificates/mozilla/Amazon_Root_CA_3.crt
│           ├── Amazon_Root_CA_4.pem -> ../../../usr/share/ca-certificates/mozilla/Amazon_Root_CA_4.crt
│           ├── ANF_Secure_Server_Root_CA.pem -> ../../../usr/share/ca-certificates/mozilla/ANF_Secure_Server_Root_CA.crt
│           ├── Atos_TrustedRoot_2011.pem -> ../../../usr/share/ca-certificates/mozilla/Atos_TrustedRoot_2011.crt
│           ├── Autoridad_de_Certificacion_Firmaprofesional_CIF_A62634068_2.pem -> ../../../usr/share/ca-certificates/mozilla/Autoridad_de_Certificacion_Firmaprofesional_CIF_A62634068_2.crt
│           ├── Autoridad_de_Certificacion_Firmaprofesional_CIF_A62634068.pem -> ../../../usr/share/ca-certificates/mozilla/Autoridad_de_Certificacion_Firmaprofesional_CIF_A62634068.crt
│           ├── b0e59380.0 -> GlobalSign_ECC_Root_CA_-_R4.pem
│           ├── b1159c4c.0 -> DigiCert_Assured_ID_Root_CA.pem
│           ├── b433981b.0 -> ANF_Secure_Server_Root_CA.pem
│           ├── b66938e9.0 -> Secure_Global_CA.pem
│           ├── b727005e.0 -> AffirmTrust_Premium.pem
│           ├── b7a5b843.0 -> TWCA_Root_Certification_Authority.pem
│           ├── b81b93f0.0 -> AC_RAIZ_FNMT-RCM_SERVIDORES_SEGUROS.pem
│           ├── Baltimore_CyberTrust_Root.pem -> ../../../usr/share/ca-certificates/mozilla/Baltimore_CyberTrust_Root.crt
│           ├── bf53fb88.0 -> Microsoft_RSA_Root_Certificate_Authority_2017.pem
│           ├── Buypass_Class_2_Root_CA.pem -> ../../../usr/share/ca-certificates/mozilla/Buypass_Class_2_Root_CA.crt
│           ├── Buypass_Class_3_Root_CA.pem -> ../../../usr/share/ca-certificates/mozilla/Buypass_Class_3_Root_CA.crt
│           ├── c01eb047.0 -> UCA_Global_G2_Root.pem
│           ├── c28a8a30.0 -> D-TRUST_Root_Class_3_CA_2_2009.pem
│           ├── ca6e4ad9.0 -> ePKI_Root_Certification_Authority.pem
│           ├── ca-certificates.crt
│           ├── CA_Disig_Root_R2.pem -> ../../../usr/share/ca-certificates/mozilla/CA_Disig_Root_R2.crt
│           ├── cbf06781.0 -> Go_Daddy_Root_Certificate_Authority_-_G2.pem
│           ├── cc450945.0 -> Izenpe.com.pem
│           ├── cd58d51e.0 -> Security_Communication_RootCA2.pem
│           ├── cd8c0d63.0 -> AC_RAIZ_FNMT-RCM.pem
│           ├── ce5e74ef.0 -> Amazon_Root_CA_1.pem
│           ├── Certainly_Root_E1.pem -> ../../../usr/share/ca-certificates/mozilla/Certainly_Root_E1.crt
│           ├── Certainly_Root_R1.pem -> ../../../usr/share/ca-certificates/mozilla/Certainly_Root_R1.crt
│           ├── Certigna.pem -> ../../../usr/share/ca-certificates/mozilla/Certigna.crt
│           ├── Certigna_Root_CA.pem -> ../../../usr/share/ca-certificates/mozilla/Certigna_Root_CA.crt
│           ├── certSIGN_Root_CA_G2.pem -> ../../../usr/share/ca-certificates/mozilla/certSIGN_Root_CA_G2.crt
│           ├── certSIGN_ROOT_CA.pem -> ../../../usr/share/ca-certificates/mozilla/certSIGN_ROOT_CA.crt
│           ├── Certum_EC-384_CA.pem -> ../../../usr/share/ca-certificates/mozilla/Certum_EC-384_CA.crt
│           ├── Certum_Trusted_Network_CA_2.pem -> ../../../usr/share/ca-certificates/mozilla/Certum_Trusted_Network_CA_2.crt
│           ├── Certum_Trusted_Network_CA.pem -> ../../../usr/share/ca-certificates/mozilla/Certum_Trusted_Network_CA.crt
│           ├── Certum_Trusted_Root_CA.pem -> ../../../usr/share/ca-certificates/mozilla/Certum_Trusted_Root_CA.crt
│           ├── CFCA_EV_ROOT.pem -> ../../../usr/share/ca-certificates/mozilla/CFCA_EV_ROOT.crt
│           ├── Comodo_AAA_Services_root.pem -> ../../../usr/share/ca-certificates/mozilla/Comodo_AAA_Services_root.crt
│           ├── COMODO_Certification_Authority.pem -> ../../../usr/share/ca-certificates/mozilla/COMODO_Certification_Authority.crt
│           ├── COMODO_ECC_Certification_Authority.pem -> ../../../usr/share/ca-certificates/mozilla/COMODO_ECC_Certification_Authority.crt
│           ├── COMODO_RSA_Certification_Authority.pem -> ../../../usr/share/ca-certificates/mozilla/COMODO_RSA_Certification_Authority.crt
│           ├── d4dae3dd.0 -> D-TRUST_Root_Class_3_CA_2_EV_2009.pem
│           ├── d52c538d.0 -> DigiCert_TLS_RSA4096_Root_G5.pem
│           ├── d6325660.0 -> COMODO_RSA_Certification_Authority.pem
│           ├── d7e8dc79.0 -> QuoVadis_Root_CA_2.pem
│           ├── d887a5bb.0 -> Trustwave_Global_ECC_P384_Certification_Authority.pem
│           ├── dc4d6a89.0 -> GlobalSign_Root_CA_-_R6.pem
│           ├── dd8e9d41.0 -> DigiCert_Global_Root_G3.pem
│           ├── de6d66f3.0 -> Amazon_Root_CA_4.pem
│           ├── DigiCert_Assured_ID_Root_CA.pem -> ../../../usr/share/ca-certificates/mozilla/DigiCert_Assured_ID_Root_CA.crt
│           ├── DigiCert_Assured_ID_Root_G2.pem -> ../../../usr/share/ca-certificates/mozilla/DigiCert_Assured_ID_Root_G2.crt
│           ├── DigiCert_Assured_ID_Root_G3.pem -> ../../../usr/share/ca-certificates/mozilla/DigiCert_Assured_ID_Root_G3.crt
│           ├── DigiCert_Global_Root_CA.pem -> ../../../usr/share/ca-certificates/mozilla/DigiCert_Global_Root_CA.crt
│           ├── DigiCert_Global_Root_G2.pem -> ../../../usr/share/ca-certificates/mozilla/DigiCert_Global_Root_G2.crt
│           ├── DigiCert_Global_Root_G3.pem -> ../../../usr/share/ca-certificates/mozilla/DigiCert_Global_Root_G3.crt
│           ├── DigiCert_High_Assurance_EV_Root_CA.pem -> ../../../usr/share/ca-certificates/mozilla/DigiCert_High_Assurance_EV_Root_CA.crt
│           ├── DigiCert_TLS_ECC_P384_Root_G5.pem -> ../../../usr/share/ca-certificates/mozilla/DigiCert_TLS_ECC_P384_Root_G5.crt
│           ├── DigiCert_TLS_RSA4096_Root_G5.pem -> ../../../usr/share/ca-certificates/mozilla/DigiCert_TLS_RSA4096_Root_G5.crt
│           ├── DigiCert_Trusted_Root_G4.pem -> ../../../usr/share/ca-certificates/mozilla/DigiCert_Trusted_Root_G4.crt
│           ├── D-TRUST_BR_Root_CA_1_2020.pem -> ../../../usr/share/ca-certificates/mozilla/D-TRUST_BR_Root_CA_1_2020.crt
│           ├── D-TRUST_EV_Root_CA_1_2020.pem -> ../../../usr/share/ca-certificates/mozilla/D-TRUST_EV_Root_CA_1_2020.crt
│           ├── D-TRUST_Root_Class_3_CA_2_2009.pem -> ../../../usr/share/ca-certificates/mozilla/D-TRUST_Root_Class_3_CA_2_2009.crt
│           ├── D-TRUST_Root_Class_3_CA_2_EV_2009.pem -> ../../../usr/share/ca-certificates/mozilla/D-TRUST_Root_Class_3_CA_2_EV_2009.crt
│           ├── e113c810.0 -> Certigna.pem
│           ├── e18bfb83.0 -> QuoVadis_Root_CA_3_G3.pem
│           ├── e35234b1.0 -> Certum_Trusted_Root_CA.pem
│           ├── e36a6752.0 -> Atos_TrustedRoot_2011.pem
│           ├── e73d606e.0 -> OISTE_WISeKey_Global_Root_GB_CA.pem
│           ├── e868b802.0 -> e-Szigno_Root_CA_2017.pem
│           ├── e8de2f56.0 -> Buypass_Class_3_Root_CA.pem
│           ├── ecccd8db.0 -> HARICA_TLS_ECC_Root_CA_2021.pem
│           ├── ed858448.0 -> vTrus_ECC_Root_CA.pem
│           ├── ee64a828.0 -> Comodo_AAA_Services_root.pem
│           ├── eed8c118.0 -> COMODO_ECC_Certification_Authority.pem
│           ├── ef954a4e.0 -> IdenTrust_Commercial_Root_CA_1.pem
│           ├── emSign_ECC_Root_CA_-_C3.pem -> ../../../usr/share/ca-certificates/mozilla/emSign_ECC_Root_CA_-_C3.crt
│           ├── emSign_ECC_Root_CA_-_G3.pem -> ../../../usr/share/ca-certificates/mozilla/emSign_ECC_Root_CA_-_G3.crt
│           ├── emSign_Root_CA_-_C1.pem -> ../../../usr/share/ca-certificates/mozilla/emSign_Root_CA_-_C1.crt
│           ├── emSign_Root_CA_-_G1.pem -> ../../../usr/share/ca-certificates/mozilla/emSign_Root_CA_-_G1.crt
│           ├── Entrust.net_Premium_2048_Secure_Server_CA.pem -> ../../../usr/share/ca-certificates/mozilla/Entrust.net_Premium_2048_Secure_Server_CA.crt
│           ├── Entrust_Root_Certification_Authority_-_EC1.pem -> ../../../usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority_-_EC1.crt
│           ├── Entrust_Root_Certification_Authority_-_G2.pem -> ../../../usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority_-_G2.crt
│           ├── Entrust_Root_Certification_Authority_-_G4.pem -> ../../../usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority_-_G4.crt
│           ├── Entrust_Root_Certification_Authority.pem -> ../../../usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority.crt
│           ├── ePKI_Root_Certification_Authority.pem -> ../../../usr/share/ca-certificates/mozilla/ePKI_Root_Certification_Authority.crt
│           ├── e-Szigno_Root_CA_2017.pem -> ../../../usr/share/ca-certificates/mozilla/e-Szigno_Root_CA_2017.crt
│           ├── E-Tugra_Certification_Authority.pem -> ../../../usr/share/ca-certificates/mozilla/E-Tugra_Certification_Authority.crt
│           ├── E-Tugra_Global_Root_CA_ECC_v3.pem -> ../../../usr/share/ca-certificates/mozilla/E-Tugra_Global_Root_CA_ECC_v3.crt
│           ├── E-Tugra_Global_Root_CA_RSA_v3.pem -> ../../../usr/share/ca-certificates/mozilla/E-Tugra_Global_Root_CA_RSA_v3.crt
│           ├── f081611a.0 -> Go_Daddy_Class_2_CA.pem
│           ├── f0c70a8d.0 -> SSL.com_EV_Root_Certification_Authority_ECC.pem
│           ├── f249de83.0 -> Trustwave_Global_Certification_Authority.pem
│           ├── f30dd6ad.0 -> USERTrust_ECC_Certification_Authority.pem
│           ├── f3377b1b.0 -> Security_Communication_Root_CA.pem
│           ├── f387163d.0 -> Starfield_Class_2_CA.pem
│           ├── f39fc864.0 -> SecureTrust_CA.pem
│           ├── f51bb24c.0 -> Certigna_Root_CA.pem
│           ├── fa5da96b.0 -> GLOBALTRUST_2020.pem
│           ├── fc5a8f99.0 -> USERTrust_RSA_Certification_Authority.pem
│           ├── fd64f3fc.0 -> TunTrust_Root_CA.pem
│           ├── fe8a2cd8.0 -> SZAFIR_ROOT_CA2.pem
│           ├── feffd413.0 -> GlobalSign_Root_E46.pem
│           ├── ff34af3f.0 -> TUBITAK_Kamu_SM_SSL_Kok_Sertifikasi_-_Surum_1.pem
│           ├── GDCA_TrustAUTH_R5_ROOT.pem -> ../../../usr/share/ca-certificates/mozilla/GDCA_TrustAUTH_R5_ROOT.crt
│           ├── GlobalSign_ECC_Root_CA_-_R4.pem -> ../../../usr/share/ca-certificates/mozilla/GlobalSign_ECC_Root_CA_-_R4.crt
│           ├── GlobalSign_ECC_Root_CA_-_R5.pem -> ../../../usr/share/ca-certificates/mozilla/GlobalSign_ECC_Root_CA_-_R5.crt
│           ├── GlobalSign_Root_CA.pem -> ../../../usr/share/ca-certificates/mozilla/GlobalSign_Root_CA.crt
│           ├── GlobalSign_Root_CA_-_R3.pem -> ../../../usr/share/ca-certificates/mozilla/GlobalSign_Root_CA_-_R3.crt
│           ├── GlobalSign_Root_CA_-_R6.pem -> ../../../usr/share/ca-certificates/mozilla/GlobalSign_Root_CA_-_R6.crt
│           ├── GlobalSign_Root_E46.pem -> ../../../usr/share/ca-certificates/mozilla/GlobalSign_Root_E46.crt
│           ├── GlobalSign_Root_R46.pem -> ../../../usr/share/ca-certificates/mozilla/GlobalSign_Root_R46.crt
│           ├── GLOBALTRUST_2020.pem -> ../../../usr/share/ca-certificates/mozilla/GLOBALTRUST_2020.crt
│           ├── Go_Daddy_Class_2_CA.pem -> ../../../usr/share/ca-certificates/mozilla/Go_Daddy_Class_2_CA.crt
│           ├── Go_Daddy_Root_Certificate_Authority_-_G2.pem -> ../../../usr/share/ca-certificates/mozilla/Go_Daddy_Root_Certificate_Authority_-_G2.crt
│           ├── GTS_Root_R1.pem -> ../../../usr/share/ca-certificates/mozilla/GTS_Root_R1.crt
│           ├── GTS_Root_R2.pem -> ../../../usr/share/ca-certificates/mozilla/GTS_Root_R2.crt
│           ├── GTS_Root_R3.pem -> ../../../usr/share/ca-certificates/mozilla/GTS_Root_R3.crt
│           ├── GTS_Root_R4.pem -> ../../../usr/share/ca-certificates/mozilla/GTS_Root_R4.crt
│           ├── HARICA_TLS_ECC_Root_CA_2021.pem -> ../../../usr/share/ca-certificates/mozilla/HARICA_TLS_ECC_Root_CA_2021.crt
│           ├── HARICA_TLS_RSA_Root_CA_2021.pem -> ../../../usr/share/ca-certificates/mozilla/HARICA_TLS_RSA_Root_CA_2021.crt
│           ├── Hellenic_Academic_and_Research_Institutions_ECC_RootCA_2015.pem -> ../../../usr/share/ca-certificates/mozilla/Hellenic_Academic_and_Research_Institutions_ECC_RootCA_2015.crt
│           ├── Hellenic_Academic_and_Research_Institutions_RootCA_2015.pem -> ../../../usr/share/ca-certificates/mozilla/Hellenic_Academic_and_Research_Institutions_RootCA_2015.crt
│           ├── HiPKI_Root_CA_-_G1.pem -> ../../../usr/share/ca-certificates/mozilla/HiPKI_Root_CA_-_G1.crt
│           ├── Hongkong_Post_Root_CA_1.pem -> ../../../usr/share/ca-certificates/mozilla/Hongkong_Post_Root_CA_1.crt
│           ├── Hongkong_Post_Root_CA_3.pem -> ../../../usr/share/ca-certificates/mozilla/Hongkong_Post_Root_CA_3.crt
│           ├── IdenTrust_Commercial_Root_CA_1.pem -> ../../../usr/share/ca-certificates/mozilla/IdenTrust_Commercial_Root_CA_1.crt
│           ├── IdenTrust_Public_Sector_Root_CA_1.pem -> ../../../usr/share/ca-certificates/mozilla/IdenTrust_Public_Sector_Root_CA_1.crt
│           ├── ISRG_Root_X1.pem -> ../../../usr/share/ca-certificates/mozilla/ISRG_Root_X1.crt
│           ├── ISRG_Root_X2.pem -> ../../../usr/share/ca-certificates/mozilla/ISRG_Root_X2.crt
│           ├── Izenpe.com.pem -> ../../../usr/share/ca-certificates/mozilla/Izenpe.com.crt
│           ├── Microsec_e-Szigno_Root_CA_2009.pem -> ../../../usr/share/ca-certificates/mozilla/Microsec_e-Szigno_Root_CA_2009.crt
│           ├── Microsoft_ECC_Root_Certificate_Authority_2017.pem -> ../../../usr/share/ca-certificates/mozilla/Microsoft_ECC_Root_Certificate_Authority_2017.crt
│           ├── Microsoft_RSA_Root_Certificate_Authority_2017.pem -> ../../../usr/share/ca-certificates/mozilla/Microsoft_RSA_Root_Certificate_Authority_2017.crt
│           ├── NAVER_Global_Root_Certification_Authority.pem -> ../../../usr/share/ca-certificates/mozilla/NAVER_Global_Root_Certification_Authority.crt
│           ├── NetLock_Arany_=Class_Gold=_Főtanúsítvány.pem -> ../../../usr/share/ca-certificates/mozilla/NetLock_Arany_=Class_Gold=_Főtanúsítvány.crt
│           ├── OISTE_WISeKey_Global_Root_GB_CA.pem -> ../../../usr/share/ca-certificates/mozilla/OISTE_WISeKey_Global_Root_GB_CA.crt
│           ├── OISTE_WISeKey_Global_Root_GC_CA.pem -> ../../../usr/share/ca-certificates/mozilla/OISTE_WISeKey_Global_Root_GC_CA.crt
│           ├── QuoVadis_Root_CA_1_G3.pem -> ../../../usr/share/ca-certificates/mozilla/QuoVadis_Root_CA_1_G3.crt
│           ├── QuoVadis_Root_CA_2_G3.pem -> ../../../usr/share/ca-certificates/mozilla/QuoVadis_Root_CA_2_G3.crt
│           ├── QuoVadis_Root_CA_2.pem -> ../../../usr/share/ca-certificates/mozilla/QuoVadis_Root_CA_2.crt
│           ├── QuoVadis_Root_CA_3_G3.pem -> ../../../usr/share/ca-certificates/mozilla/QuoVadis_Root_CA_3_G3.crt
│           ├── QuoVadis_Root_CA_3.pem -> ../../../usr/share/ca-certificates/mozilla/QuoVadis_Root_CA_3.crt
│           ├── Secure_Global_CA.pem -> ../../../usr/share/ca-certificates/mozilla/Secure_Global_CA.crt
│           ├── SecureSign_RootCA11.pem -> ../../../usr/share/ca-certificates/mozilla/SecureSign_RootCA11.crt
│           ├── SecureTrust_CA.pem -> ../../../usr/share/ca-certificates/mozilla/SecureTrust_CA.crt
│           ├── Security_Communication_ECC_RootCA1.pem -> ../../../usr/share/ca-certificates/mozilla/Security_Communication_ECC_RootCA1.crt
│           ├── Security_Communication_RootCA2.pem -> ../../../usr/share/ca-certificates/mozilla/Security_Communication_RootCA2.crt
│           ├── Security_Communication_RootCA3.pem -> ../../../usr/share/ca-certificates/mozilla/Security_Communication_RootCA3.crt
│           ├── Security_Communication_Root_CA.pem -> ../../../usr/share/ca-certificates/mozilla/Security_Communication_Root_CA.crt
│           ├── SSL.com_EV_Root_Certification_Authority_ECC.pem -> ../../../usr/share/ca-certificates/mozilla/SSL.com_EV_Root_Certification_Authority_ECC.crt
│           ├── SSL.com_EV_Root_Certification_Authority_RSA_R2.pem -> ../../../usr/share/ca-certificates/mozilla/SSL.com_EV_Root_Certification_Authority_RSA_R2.crt
│           ├── SSL.com_Root_Certification_Authority_ECC.pem -> ../../../usr/share/ca-certificates/mozilla/SSL.com_Root_Certification_Authority_ECC.crt
│           ├── SSL.com_Root_Certification_Authority_RSA.pem -> ../../../usr/share/ca-certificates/mozilla/SSL.com_Root_Certification_Authority_RSA.crt
│           ├── Starfield_Class_2_CA.pem -> ../../../usr/share/ca-certificates/mozilla/Starfield_Class_2_CA.crt
│           ├── Starfield_Root_Certificate_Authority_-_G2.pem -> ../../../usr/share/ca-certificates/mozilla/Starfield_Root_Certificate_Authority_-_G2.crt
│           ├── Starfield_Services_Root_Certificate_Authority_-_G2.pem -> ../../../usr/share/ca-certificates/mozilla/Starfield_Services_Root_Certificate_Authority_-_G2.crt
│           ├── SwissSign_Gold_CA_-_G2.pem -> ../../../usr/share/ca-certificates/mozilla/SwissSign_Gold_CA_-_G2.crt
│           ├── SwissSign_Silver_CA_-_G2.pem -> ../../../usr/share/ca-certificates/mozilla/SwissSign_Silver_CA_-_G2.crt
│           ├── SZAFIR_ROOT_CA2.pem -> ../../../usr/share/ca-certificates/mozilla/SZAFIR_ROOT_CA2.crt
│           ├── Telia_Root_CA_v2.pem -> ../../../usr/share/ca-certificates/mozilla/Telia_Root_CA_v2.crt
│           ├── TeliaSonera_Root_CA_v1.pem -> ../../../usr/share/ca-certificates/mozilla/TeliaSonera_Root_CA_v1.crt
│           ├── TrustCor_ECA-1.pem -> ../../../usr/share/ca-certificates/mozilla/TrustCor_ECA-1.crt
│           ├── TrustCor_RootCert_CA-1.pem -> ../../../usr/share/ca-certificates/mozilla/TrustCor_RootCert_CA-1.crt
│           ├── TrustCor_RootCert_CA-2.pem -> ../../../usr/share/ca-certificates/mozilla/TrustCor_RootCert_CA-2.crt
│           ├── Trustwave_Global_Certification_Authority.pem -> ../../../usr/share/ca-certificates/mozilla/Trustwave_Global_Certification_Authority.crt
│           ├── Trustwave_Global_ECC_P256_Certification_Authority.pem -> ../../../usr/share/ca-certificates/mozilla/Trustwave_Global_ECC_P256_Certification_Authority.crt
│           ├── Trustwave_Global_ECC_P384_Certification_Authority.pem -> ../../../usr/share/ca-certificates/mozilla/Trustwave_Global_ECC_P384_Certification_Authority.crt
│           ├── T-TeleSec_GlobalRoot_Class_2.pem -> ../../../usr/share/ca-certificates/mozilla/T-TeleSec_GlobalRoot_Class_2.crt
│           ├── T-TeleSec_GlobalRoot_Class_3.pem -> ../../../usr/share/ca-certificates/mozilla/T-TeleSec_GlobalRoot_Class_3.crt
│           ├── TUBITAK_Kamu_SM_SSL_Kok_Sertifikasi_-_Surum_1.pem -> ../../../usr/share/ca-certificates/mozilla/TUBITAK_Kamu_SM_SSL_Kok_Sertifikasi_-_Surum_1.crt
│           ├── TunTrust_Root_CA.pem -> ../../../usr/share/ca-certificates/mozilla/TunTrust_Root_CA.crt
│           ├── TWCA_Global_Root_CA.pem -> ../../../usr/share/ca-certificates/mozilla/TWCA_Global_Root_CA.crt
│           ├── TWCA_Root_Certification_Authority.pem -> ../../../usr/share/ca-certificates/mozilla/TWCA_Root_Certification_Authority.crt
│           ├── UCA_Extended_Validation_Root.pem -> ../../../usr/share/ca-certificates/mozilla/UCA_Extended_Validation_Root.crt
│           ├── UCA_Global_G2_Root.pem -> ../../../usr/share/ca-certificates/mozilla/UCA_Global_G2_Root.crt
│           ├── USERTrust_ECC_Certification_Authority.pem -> ../../../usr/share/ca-certificates/mozilla/USERTrust_ECC_Certification_Authority.crt
│           ├── USERTrust_RSA_Certification_Authority.pem -> ../../../usr/share/ca-certificates/mozilla/USERTrust_RSA_Certification_Authority.crt
│           ├── vTrus_ECC_Root_CA.pem -> ../../../usr/share/ca-certificates/mozilla/vTrus_ECC_Root_CA.crt
│           ├── vTrus_Root_CA.pem -> ../../../usr/share/ca-certificates/mozilla/vTrus_Root_CA.crt
│           └── XRamp_Global_CA_Root.pem -> ../../../usr/share/ca-certificates/mozilla/XRamp_Global_CA_Root.crt
├── lib
│   ├── ld-linux-x86-64.so.2
│   ├── libanl.so.1
│   ├── libatomic.so -> libatomic.so.1.2.0
│   ├── libatomic.so.1 -> libatomic.so.1.2.0
│   ├── libatomic.so.1.2.0
│   ├── libc.so.6
│   ├── libdl.so.2
│   ├── libgcc_s.so
│   ├── libgcc_s.so.1
│   ├── libm.so.6
│   ├── libmvec.so.1
│   ├── libnss_dns.so.2
│   ├── libnss_files.so.2
│   ├── libpthread.so.0
│   ├── libresolv.so.2
│   ├── librt.so.1
│   └── libutil.so.1
├── lib64 -> lib
├── mnt
├── opt
├── root
├── run
├── sbin
├── sys
├── tmp
├── usr
│   ├── bin
│   ├── lib
│   │   └── os-release
│   ├── lib64 -> lib
│   ├── sbin
│   └── share
│       └── ca-certificates
│           └── mozilla
│               ├── ACCVRAIZ1.crt
│               ├── AC_RAIZ_FNMT-RCM.crt
│               ├── AC_RAIZ_FNMT-RCM_SERVIDORES_SEGUROS.crt
│               ├── Actalis_Authentication_Root_CA.crt
│               ├── AffirmTrust_Commercial.crt
│               ├── AffirmTrust_Networking.crt
│               ├── AffirmTrust_Premium.crt
│               ├── AffirmTrust_Premium_ECC.crt
│               ├── Amazon_Root_CA_1.crt
│               ├── Amazon_Root_CA_2.crt
│               ├── Amazon_Root_CA_3.crt
│               ├── Amazon_Root_CA_4.crt
│               ├── ANF_Secure_Server_Root_CA.crt
│               ├── Atos_TrustedRoot_2011.crt
│               ├── Autoridad_de_Certificacion_Firmaprofesional_CIF_A62634068_2.crt
│               ├── Autoridad_de_Certificacion_Firmaprofesional_CIF_A62634068.crt
│               ├── Baltimore_CyberTrust_Root.crt
│               ├── Buypass_Class_2_Root_CA.crt
│               ├── Buypass_Class_3_Root_CA.crt
│               ├── CA_Disig_Root_R2.crt
│               ├── Certainly_Root_E1.crt
│               ├── Certainly_Root_R1.crt
│               ├── Certigna.crt
│               ├── Certigna_Root_CA.crt
│               ├── certSIGN_ROOT_CA.crt
│               ├── certSIGN_Root_CA_G2.crt
│               ├── Certum_EC-384_CA.crt
│               ├── Certum_Trusted_Network_CA_2.crt
│               ├── Certum_Trusted_Network_CA.crt
│               ├── Certum_Trusted_Root_CA.crt
│               ├── CFCA_EV_ROOT.crt
│               ├── Comodo_AAA_Services_root.crt
│               ├── COMODO_Certification_Authority.crt
│               ├── COMODO_ECC_Certification_Authority.crt
│               ├── COMODO_RSA_Certification_Authority.crt
│               ├── DigiCert_Assured_ID_Root_CA.crt
│               ├── DigiCert_Assured_ID_Root_G2.crt
│               ├── DigiCert_Assured_ID_Root_G3.crt
│               ├── DigiCert_Global_Root_CA.crt
│               ├── DigiCert_Global_Root_G2.crt
│               ├── DigiCert_Global_Root_G3.crt
│               ├── DigiCert_High_Assurance_EV_Root_CA.crt
│               ├── DigiCert_TLS_ECC_P384_Root_G5.crt
│               ├── DigiCert_TLS_RSA4096_Root_G5.crt
│               ├── DigiCert_Trusted_Root_G4.crt
│               ├── D-TRUST_BR_Root_CA_1_2020.crt
│               ├── D-TRUST_EV_Root_CA_1_2020.crt
│               ├── D-TRUST_Root_Class_3_CA_2_2009.crt
│               ├── D-TRUST_Root_Class_3_CA_2_EV_2009.crt
│               ├── emSign_ECC_Root_CA_-_C3.crt
│               ├── emSign_ECC_Root_CA_-_G3.crt
│               ├── emSign_Root_CA_-_C1.crt
│               ├── emSign_Root_CA_-_G1.crt
│               ├── Entrust.net_Premium_2048_Secure_Server_CA.crt
│               ├── Entrust_Root_Certification_Authority.crt
│               ├── Entrust_Root_Certification_Authority_-_EC1.crt
│               ├── Entrust_Root_Certification_Authority_-_G2.crt
│               ├── Entrust_Root_Certification_Authority_-_G4.crt
│               ├── ePKI_Root_Certification_Authority.crt
│               ├── e-Szigno_Root_CA_2017.crt
│               ├── E-Tugra_Certification_Authority.crt
│               ├── E-Tugra_Global_Root_CA_ECC_v3.crt
│               ├── E-Tugra_Global_Root_CA_RSA_v3.crt
│               ├── GDCA_TrustAUTH_R5_ROOT.crt
│               ├── GlobalSign_ECC_Root_CA_-_R4.crt
│               ├── GlobalSign_ECC_Root_CA_-_R5.crt
│               ├── GlobalSign_Root_CA.crt
│               ├── GlobalSign_Root_CA_-_R3.crt
│               ├── GlobalSign_Root_CA_-_R6.crt
│               ├── GlobalSign_Root_E46.crt
│               ├── GlobalSign_Root_R46.crt
│               ├── GLOBALTRUST_2020.crt
│               ├── Go_Daddy_Class_2_CA.crt
│               ├── Go_Daddy_Root_Certificate_Authority_-_G2.crt
│               ├── GTS_Root_R1.crt
│               ├── GTS_Root_R2.crt
│               ├── GTS_Root_R3.crt
│               ├── GTS_Root_R4.crt
│               ├── HARICA_TLS_ECC_Root_CA_2021.crt
│               ├── HARICA_TLS_RSA_Root_CA_2021.crt
│               ├── Hellenic_Academic_and_Research_Institutions_ECC_RootCA_2015.crt
│               ├── Hellenic_Academic_and_Research_Institutions_RootCA_2015.crt
│               ├── HiPKI_Root_CA_-_G1.crt
│               ├── Hongkong_Post_Root_CA_1.crt
│               ├── Hongkong_Post_Root_CA_3.crt
│               ├── IdenTrust_Commercial_Root_CA_1.crt
│               ├── IdenTrust_Public_Sector_Root_CA_1.crt
│               ├── ISRG_Root_X1.crt
│               ├── ISRG_Root_X2.crt
│               ├── Izenpe.com.crt
│               ├── Microsec_e-Szigno_Root_CA_2009.crt
│               ├── Microsoft_ECC_Root_Certificate_Authority_2017.crt
│               ├── Microsoft_RSA_Root_Certificate_Authority_2017.crt
│               ├── NAVER_Global_Root_Certification_Authority.crt
│               ├── NetLock_Arany_=Class_Gold=_Főtanúsítvány.crt
│               ├── OISTE_WISeKey_Global_Root_GB_CA.crt
│               ├── OISTE_WISeKey_Global_Root_GC_CA.crt
│               ├── QuoVadis_Root_CA_1_G3.crt
│               ├── QuoVadis_Root_CA_2.crt
│               ├── QuoVadis_Root_CA_2_G3.crt
│               ├── QuoVadis_Root_CA_3.crt
│               ├── QuoVadis_Root_CA_3_G3.crt
│               ├── Secure_Global_CA.crt
│               ├── SecureSign_RootCA11.crt
│               ├── SecureTrust_CA.crt
│               ├── Security_Communication_ECC_RootCA1.crt
│               ├── Security_Communication_RootCA2.crt
│               ├── Security_Communication_RootCA3.crt
│               ├── Security_Communication_Root_CA.crt
│               ├── SSL.com_EV_Root_Certification_Authority_ECC.crt
│               ├── SSL.com_EV_Root_Certification_Authority_RSA_R2.crt
│               ├── SSL.com_Root_Certification_Authority_ECC.crt
│               ├── SSL.com_Root_Certification_Authority_RSA.crt
│               ├── Starfield_Class_2_CA.crt
│               ├── Starfield_Root_Certificate_Authority_-_G2.crt
│               ├── Starfield_Services_Root_Certificate_Authority_-_G2.crt
│               ├── SwissSign_Gold_CA_-_G2.crt
│               ├── SwissSign_Silver_CA_-_G2.crt
│               ├── SZAFIR_ROOT_CA2.crt
│               ├── Telia_Root_CA_v2.crt
│               ├── TeliaSonera_Root_CA_v1.crt
│               ├── TrustCor_ECA-1.crt
│               ├── TrustCor_RootCert_CA-1.crt
│               ├── TrustCor_RootCert_CA-2.crt
│               ├── Trustwave_Global_Certification_Authority.crt
│               ├── Trustwave_Global_ECC_P256_Certification_Authority.crt
│               ├── Trustwave_Global_ECC_P384_Certification_Authority.crt
│               ├── T-TeleSec_GlobalRoot_Class_2.crt
│               ├── T-TeleSec_GlobalRoot_Class_3.crt
│               ├── TUBITAK_Kamu_SM_SSL_Kok_Sertifikasi_-_Surum_1.crt
│               ├── TunTrust_Root_CA.crt
│               ├── TWCA_Global_Root_CA.crt
│               ├── TWCA_Root_Certification_Authority.crt
│               ├── UCA_Extended_Validation_Root.crt
│               ├── UCA_Global_G2_Root.crt
│               ├── USERTrust_ECC_Certification_Authority.crt
│               ├── USERTrust_RSA_Certification_Authority.crt
│               ├── vTrus_ECC_Root_CA.crt
│               ├── vTrus_Root_CA.crt
│               └── XRamp_Global_CA_Root.crt
└── var

```