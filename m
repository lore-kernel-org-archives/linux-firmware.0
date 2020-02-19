Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FUZZY_CPILL,INCLUDES_PATCH,NORMAL_HTTP_TO_IP,
	NUMERIC_HTTP_ADDR,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0251C34047
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Feb 2020 12:35:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BFAC824670; Wed, 19 Feb 2020 12:35:22 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4194024656
	for <linux-firmware@kernel.org>; Wed, 19 Feb 2020 12:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582115722;
	bh=5bqn4IZMqZqWk6P6eUUQTCAYDEZOy9b4uG/MCf/1yaM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=OhQgorBuoF1HcRDaRI7kPtU5Ovr1kD5nNVnRX6bksq9iAOfXGg46fWyOR6AMcqzla
	 MmuYvk1LQoK0zbdgBqIaiCTd8IMmhbdkMUOTkrywYTS5+1Cwe6XQL3nrLg2PmugPkE
	 A+67atY+4yev/532Cb5+OFOKf7FNMEv1kHM8tbeE=
Received: by mail-qk1-f182.google.com with SMTP id p7so22796571qkh.10
        for <linux-firmware@kernel.org>; Wed, 19 Feb 2020 04:35:22 -0800 (PST)
X-Gm-Message-State: APjAAAWSOS0Ib+wsD2BILz/Klimcbm4EiINnAxLy7MsvXYspX9gI4QTq
	KLzejowGTwnKgDUGHIS2iGiNYCZ3HggNOXEnpwI=
X-Google-Smtp-Source: APXvYqyxteupazn9tB4t5NmA65llVfjBo2G+D+nouKaf4sea7+wjqZa5IRKiew8k6MhXbBR65NiJYt81e0Jt2P+gvIM=
X-Received: by 2002:a05:620a:1f1:: with SMTP id x17mr22478778qkn.302.1582115719916;
 Wed, 19 Feb 2020 04:35:19 -0800 (PST)
MIME-Version: 1.0
References: <1581918402-12339-1-git-send-email-gsamaiya@nvidia.com>
In-Reply-To: <1581918402-12339-1-git-send-email-gsamaiya@nvidia.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 19 Feb 2020 07:35:08 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7YH+UBnOY5ZheoxCAPib52qGa+dvYjubr3_GQbapxybg@mail.gmail.com>
Message-ID: <CA+5PVA7YH+UBnOY5ZheoxCAPib52qGa+dvYjubr3_GQbapxybg@mail.gmail.com>
Subject: Re: [PATCH] nvidia: add TU116/117 signed firmware
To: Gourav Samaiya <gsamaiya@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Mon, Feb 17, 2020 at 12:46 AM Gourav Samaiya <gsamaiya@nvidia.com> wrote:
>
> These NVIDIA-signed firmwares are required to enable the graphics engine
> on Turing TU11X GPUs.
>
> Signed-off-by: Gourav Samaiya <gsamaiya@nvidia.com>
> Tested-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  WHENCE                                  |  44 ++++++++++++++++++++++++++++++++
>  nvidia/tu116/acr/bl.bin                 | Bin 0 -> 1280 bytes
>  nvidia/tu116/acr/ucode_ahesasc.bin      | Bin 0 -> 22784 bytes
>  nvidia/tu116/acr/ucode_asb.bin          | Bin 0 -> 13312 bytes
>  nvidia/tu116/acr/ucode_unload.bin       | Bin 0 -> 12288 bytes
>  nvidia/tu116/acr/unload_bl.bin          | Bin 0 -> 1280 bytes
>  nvidia/tu116/gr/fecs_bl.bin             | Bin 0 -> 576 bytes
>  nvidia/tu116/gr/fecs_data.bin           | Bin 0 -> 5256 bytes
>  nvidia/tu116/gr/fecs_inst.bin           | Bin 0 -> 28783 bytes
>  nvidia/tu116/gr/fecs_sig.bin            | Bin 0 -> 192 bytes
>  nvidia/tu116/gr/gpccs_bl.bin            | Bin 0 -> 576 bytes
>  nvidia/tu116/gr/gpccs_data.bin          | Bin 0 -> 2640 bytes
>  nvidia/tu116/gr/gpccs_inst.bin          | Bin 0 -> 12717 bytes
>  nvidia/tu116/gr/gpccs_sig.bin           | Bin 0 -> 192 bytes
>  nvidia/tu116/gr/sw_bundle_init.bin      | Bin 0 -> 7456 bytes
>  nvidia/tu116/gr/sw_ctx.bin              | Bin 0 -> 6936 bytes
>  nvidia/tu116/gr/sw_method_init.bin      | Bin 0 -> 13424 bytes
>  nvidia/tu116/gr/sw_nonctx.bin           | Bin 0 -> 3856 bytes
>  nvidia/tu116/gr/sw_veid_bundle_init.bin | Bin 0 -> 176 bytes
>  nvidia/tu116/nvdec/scrubber.bin         | Bin 0 -> 4352 bytes
>  nvidia/tu116/sec2/desc.bin              | Bin 0 -> 656 bytes
>  nvidia/tu116/sec2/image.bin             | Bin 0 -> 60928 bytes
>  nvidia/tu116/sec2/sig.bin               | Bin 0 -> 192 bytes
>  nvidia/tu117/acr/bl.bin                 |   1 +
>  nvidia/tu117/acr/ucode_ahesasc.bin      |   1 +
>  nvidia/tu117/acr/ucode_asb.bin          |   1 +
>  nvidia/tu117/acr/ucode_unload.bin       |   1 +
>  nvidia/tu117/acr/unload_bl.bin          |   1 +
>  nvidia/tu117/gr/fecs_bl.bin             |   1 +
>  nvidia/tu117/gr/fecs_data.bin           | Bin 0 -> 5256 bytes
>  nvidia/tu117/gr/fecs_inst.bin           | Bin 0 -> 28783 bytes
>  nvidia/tu117/gr/fecs_sig.bin            | Bin 0 -> 192 bytes
>  nvidia/tu117/gr/gpccs_bl.bin            |   1 +
>  nvidia/tu117/gr/gpccs_data.bin          | Bin 0 -> 2640 bytes
>  nvidia/tu117/gr/gpccs_inst.bin          | Bin 0 -> 12717 bytes
>  nvidia/tu117/gr/gpccs_sig.bin           | Bin 0 -> 192 bytes
>  nvidia/tu117/gr/sw_bundle_init.bin      | Bin 0 -> 7456 bytes
>  nvidia/tu117/gr/sw_ctx.bin              | Bin 0 -> 6936 bytes
>  nvidia/tu117/gr/sw_method_init.bin      | Bin 0 -> 13424 bytes
>  nvidia/tu117/gr/sw_nonctx.bin           | Bin 0 -> 3856 bytes
>  nvidia/tu117/gr/sw_veid_bundle_init.bin | Bin 0 -> 176 bytes
>  nvidia/tu117/nvdec/scrubber.bin         |   1 +
>  nvidia/tu117/sec2/desc.bin              |   1 +
>  nvidia/tu117/sec2/image.bin             |   1 +
>  nvidia/tu117/sec2/sig.bin               |   1 +
>  45 files changed, 55 insertions(+)
>  create mode 100644 nvidia/tu116/acr/bl.bin
>  create mode 100644 nvidia/tu116/acr/ucode_ahesasc.bin
>  create mode 100644 nvidia/tu116/acr/ucode_asb.bin
>  create mode 100644 nvidia/tu116/acr/ucode_unload.bin
>  create mode 100644 nvidia/tu116/acr/unload_bl.bin
>  create mode 100644 nvidia/tu116/gr/fecs_bl.bin
>  create mode 100644 nvidia/tu116/gr/fecs_data.bin
>  create mode 100644 nvidia/tu116/gr/fecs_inst.bin
>  create mode 100644 nvidia/tu116/gr/fecs_sig.bin
>  create mode 100644 nvidia/tu116/gr/gpccs_bl.bin
>  create mode 100644 nvidia/tu116/gr/gpccs_data.bin
>  create mode 100644 nvidia/tu116/gr/gpccs_inst.bin
>  create mode 100644 nvidia/tu116/gr/gpccs_sig.bin
>  create mode 100644 nvidia/tu116/gr/sw_bundle_init.bin
>  create mode 100644 nvidia/tu116/gr/sw_ctx.bin
>  create mode 100644 nvidia/tu116/gr/sw_method_init.bin
>  create mode 100644 nvidia/tu116/gr/sw_nonctx.bin
>  create mode 100644 nvidia/tu116/gr/sw_veid_bundle_init.bin
>  create mode 100644 nvidia/tu116/nvdec/scrubber.bin
>  create mode 100644 nvidia/tu116/sec2/desc.bin
>  create mode 100644 nvidia/tu116/sec2/image.bin
>  create mode 100644 nvidia/tu116/sec2/sig.bin
>  create mode 120000 nvidia/tu117/acr/bl.bin
>  create mode 120000 nvidia/tu117/acr/ucode_ahesasc.bin
>  create mode 120000 nvidia/tu117/acr/ucode_asb.bin
>  create mode 120000 nvidia/tu117/acr/ucode_unload.bin
>  create mode 120000 nvidia/tu117/acr/unload_bl.bin
>  create mode 120000 nvidia/tu117/gr/fecs_bl.bin
>  create mode 100644 nvidia/tu117/gr/fecs_data.bin
>  create mode 100644 nvidia/tu117/gr/fecs_inst.bin
>  create mode 100644 nvidia/tu117/gr/fecs_sig.bin
>  create mode 120000 nvidia/tu117/gr/gpccs_bl.bin
>  create mode 100644 nvidia/tu117/gr/gpccs_data.bin
>  create mode 100644 nvidia/tu117/gr/gpccs_inst.bin
>  create mode 100644 nvidia/tu117/gr/gpccs_sig.bin
>  create mode 100644 nvidia/tu117/gr/sw_bundle_init.bin
>  create mode 100644 nvidia/tu117/gr/sw_ctx.bin
>  create mode 100644 nvidia/tu117/gr/sw_method_init.bin
>  create mode 100644 nvidia/tu117/gr/sw_nonctx.bin
>  create mode 100644 nvidia/tu117/gr/sw_veid_bundle_init.bin
>  create mode 120000 nvidia/tu117/nvdec/scrubber.bin
>  create mode 120000 nvidia/tu117/sec2/desc.bin
>  create mode 120000 nvidia/tu117/sec2/image.bin
>  create mode 120000 nvidia/tu117/sec2/sig.bin
>
> diff --git a/WHENCE b/WHENCE
> index e802906..3d99187 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -4340,6 +4340,50 @@ File: nvidia/tu106/nvdec/scrubber.bin
>  File: nvidia/tu106/sec2/desc.bin
>  File: nvidia/tu106/sec2/image.bin
>  File: nvidia/tu106/sec2/sig.bin
> +File: nvidia/tu116/acr/bl.bin
> +File: nvidia/tu116/acr/ucode_ahesasc.bin
> +File: nvidia/tu116/acr/ucode_asb.bin
> +File: nvidia/tu116/acr/ucode_unload.bin
> +File: nvidia/tu116/acr/unload_bl.bin
> +File: nvidia/tu116/gr/fecs_bl.bin
> +File: nvidia/tu116/gr/fecs_data.bin
> +File: nvidia/tu116/gr/fecs_inst.bin
> +File: nvidia/tu116/gr/fecs_sig.bin
> +File: nvidia/tu116/gr/gpccs_bl.bin
> +File: nvidia/tu116/gr/gpccs_data.bin
> +File: nvidia/tu116/gr/gpccs_inst.bin
> +File: nvidia/tu116/gr/gpccs_sig.bin
> +File: nvidia/tu116/gr/sw_bundle_init.bin
> +File: nvidia/tu116/gr/sw_ctx.bin
> +File: nvidia/tu116/gr/sw_method_init.bin
> +File: nvidia/tu116/gr/sw_nonctx.bin
> +File: nvidia/tu116/gr/sw_veid_bundle_init.bin
> +File: nvidia/tu116/nvdec/scrubber.bin
> +File: nvidia/tu116/sec2/desc.bin
> +File: nvidia/tu116/sec2/image.bin
> +File: nvidia/tu116/sec2/sig.bin
> +File: nvidia/tu117/acr/bl.bin
> +File: nvidia/tu117/acr/ucode_ahesasc.bin
> +File: nvidia/tu117/acr/ucode_asb.bin
> +File: nvidia/tu117/acr/ucode_unload.bin
> +File: nvidia/tu117/acr/unload_bl.bin
> +File: nvidia/tu117/gr/fecs_bl.bin
> +File: nvidia/tu117/gr/fecs_data.bin
> +File: nvidia/tu117/gr/fecs_inst.bin
> +File: nvidia/tu117/gr/fecs_sig.bin
> +File: nvidia/tu117/gr/gpccs_bl.bin
> +File: nvidia/tu117/gr/gpccs_data.bin
> +File: nvidia/tu117/gr/gpccs_inst.bin
> +File: nvidia/tu117/gr/gpccs_sig.bin
> +File: nvidia/tu117/gr/sw_bundle_init.bin
> +File: nvidia/tu117/gr/sw_ctx.bin
> +File: nvidia/tu117/gr/sw_method_init.bin
> +File: nvidia/tu117/gr/sw_nonctx.bin
> +File: nvidia/tu117/gr/sw_veid_bundle_init.bin
> +File: nvidia/tu117/nvdec/scrubber.bin
> +File: nvidia/tu117/sec2/desc.bin
> +File: nvidia/tu117/sec2/image.bin
> +File: nvidia/tu117/sec2/sig.bin
>
>  File: nvidia/tu10x/typec/ccg_primary.cyacd
>  File: nvidia/tu10x/typec/ccg_secondary.cyacd
> diff --git a/nvidia/tu116/acr/bl.bin b/nvidia/tu116/acr/bl.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..788100b7c45ebf7a50f1e19fa13ad08a145a7a6a
> GIT binary patch
> literal 1280
> zcmd^7y-veG40is?g_br643#?Z2;EV{${WDOJFv5NfglBOX=%bx@c^w9IwWIf7+|EZ
> zFm!5=4wR(Ifv@e*0Um&2>9egn+xkAsV*@|}Gz}pV8KEHli506lg?54YLRLT4H-CVA
> z0IovZJ2eVO<rYe%zD~QFnMFHR_(t59I=!wHT%+x6da*;DD*uG=iSRMZiv!|j#O0O3
> z*NQ;no#ktVdgb^r3KILIfV`^?JzVSX8QpEb$a}gm061oQ@;N}Mg-3|JG0U@3s^C<K
> zw-;mlt^Oo>P3*g$XDkR*si%j`2ro(GJLm<CW&bba4C<TV2XQBLQF{d_lTRUL_AZAr
> zBouKc&$Qu}U^`=EnkqWE_aJczD>sm_bl^Z9Kuy*UMIgG0VQ>SLej^*%M;x*d%ClJ0
> VU`>-Xt=L6Eac^d>?;-tBW#2d4q4EF#
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/acr/ucode_ahesasc.bin b/nvidia/tu116/acr/ucode_ahesasc.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..1c870e72d071f7f04c5ae8db146ebda8ddcbc052
> GIT binary patch
> literal 22784
> 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
> R5%@>oAAx@a{*NK>KLBiVJ^=s#
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/acr/ucode_asb.bin b/nvidia/tu116/acr/ucode_asb.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..f596ecbe8c3f44f06035190c230329d63346a104
> GIT binary patch
> literal 13312
> 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
> HgU<g8(g6^#
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/acr/ucode_unload.bin b/nvidia/tu116/acr/ucode_unload.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..0c95ca7e5ab1c96f87efb5702f8106a136b2a089
> GIT binary patch
> literal 12288
> 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
> K?SlR<3;199ZN3Qr
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/acr/unload_bl.bin b/nvidia/tu116/acr/unload_bl.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..0cb763529fda7e21242299da4737cc58a9beb927
> GIT binary patch
> literal 1280
> zcmd^7F;Bu!5WZI^z6wIA4kS$e1a{Nif1sQH!QGujYf|GYNXtO{0gzONc4XE;M$yHA
> ziJCl3ThgcZpo4?{0P&LV?sB=ieBb3}IsgGQ6(JJ^Q9%3`TZzxbO6?NgYa4!t2j~Nc
> zB7}o89Z0OSQ7>~f*4s`D);0WBYCkvFO)V2D>+G`2J!VzK2l!JeX0U4ZsGU$-R5Dl1
> zJXLh_YK1xF@G<Zr^At$hD~=sJ>-Y)Xt;gwGyfp$i;RnhEK&g#Sh_fM2lTuv3tweOz
> zYuugTJa~!ByPtQg2~?S*`CRv}Xy97tC5?Rk7jimt>;5~n=MC9=4JcDAAmrvgA?HXa
> z5LTL~<4?(U$>}04X!PEJ$fms9M8@RMg4BbWq8-UVwIYU5A1cFUGBJ+{NhT=I;4PiE
> U>bzxyHWCU4%ld|Y)8CW#1rbo3Y5)KL
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/gr/fecs_bl.bin b/nvidia/tu116/gr/fecs_bl.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..b2b9a250d75e0c079da3f4ac43e7ee1afb2c24f1
> GIT binary patch
> literal 576
> zcmew$B5Tda009a>$^pb=0uc~U2V;O}kU|)SieF$*U|{&i!mxKqoj@JK52j9__>6g+
> zGv;&sWSTKsXxmec8FTozeUX?kOZe|U))^B-{(WNrtC`O+<tN9Ke>{KZvHqWb_1|r%
> zD9?<U+<Twwng78qtB&E<JeD0Zfi~`V2PBrw|HAR{2RmG)z>JxK+rDyan<DXdKI^~f
> z412%W&97tVV_;z0^KZhhpR7CngEamA!twqG^WHC=3>{3r=0h#P)Y{3=3zFWvfPrTd
> a_s^qtcj_2^9^Jd-H!NtNz8$5|LjVA-PiV&g
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/gr/fecs_data.bin b/nvidia/tu116/gr/fecs_data.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..51d2c176a0841a66836fd11056f0a3b789d4c24b
> GIT binary patch
> literal 5256
> zcmeH}p^w{U7>9qCxtW_;kri24K!AZkCKY7uDpl2i-%U}jV5$NR+<FHhE#nyr2nZ<1
> zRRaYBg}KvK9oQc*P!L#{KVh0QUN|t&=gTEcz^2p4G)?}Z$M5IIuRlAlZ29ed`%Rud
> z%<p$Uf28h%#}6JozW-2+pEg5Ebr8gNl`vh;nJI#gHiZ4{d>exc=e_#vQ~eBYAgVad
> z?Bv?cS9aDta&&TJ4T(Px7e`K(%vVQ_(=Q#p>RD0WNek}v9l39vzz`;VKY81CtYg+Z
> zcBgmDTE~`7t?sGg6XH4OYk20U1<{$6LVo7#FvOvCJ#xAnIr($sRx#!t#y*TDRx<JQ
> z`-wYmm}}<tXl9LP&NO%Ixg%XT{_4V-UO0NY;JiyGv)4X9l+;Sn_<54*oc}c79%Alc
> z!1W5QmvW7mH4npjSFEEV%YmcQrHXrhfGRj}1y{j=A{;ovML19u2d?6(I8clO$G8{=
> zs^P#jTnz_GaNq=&;6Qa8xQ?siKq(HK;!+%_fde;i4IC)Lfiql&12u8rCa#GCwQxYS
> zr^^-&G%K?9tk6?xr$wO{(nZnnqKF4DTolPm_z|zmBJW%hUl;KwAzz|?qJE-&qJE-&
> zIB*45!GR(iP;u&q166V0Dz1tH#W>)}qJB6~4F|5_YB*4W11Goy2dd-1bzB_>yff4f
> zm*P?!sDT4Fa19(N!vRki^}~UhIB*l!#6ftz7+IT51v)Ue10Ta(peXFFU%v4EC3Bv+
> z3+K;yUc<YoSvkrIloco|@L#Wh{?!}&yQ}Sa&2E0&SD38BP6fI3;n>aCCElE|pHGH1
> zY3pgo-Tl_n-Qo32;S4s6y~OqYzStepeqzwKjF12!{N)Hsgx@V=o3u_Pd%M4xZ1jh4
> z%WD7pFrT^Kt73h=rU!IZ&^>TVclZ`oEt%es-fRrN&~Lt@@0|A>ui#gDPW9=}PMr-;
> z-KKX-3i`L~8J-@l2cef6o_YH2jIaNY{*=Cs-Y#8@+}7A>K6YgKyeFGpZ#i+&rQf6H
> zOH+Es90qfzV`7i~alp6vnz)473nHvuIPptzuiPG9-SmoINa}sYrW|Dj$_kVfC@WA_
> NpsYYyf&W1T-UG2JI_>}f
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/gr/fecs_inst.bin b/nvidia/tu116/gr/fecs_inst.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..310f23cf0f51ba27dc6bd0ae63c3108d13bc2aae
> GIT binary patch
> literal 28783
> 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
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/gr/fecs_sig.bin b/nvidia/tu116/gr/fecs_sig.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..a0af415d24b3cb445e343b2fb75bdd6f2529d922
> GIT binary patch
> literal 192
> zcmbRC`$2c+d?^tN@11Fh`#Pls^MdPwl2)ERo#P|+XQcs??(t92#%b1-@%wxi+x=ZU
> z^}Vm@!JB<kZr|e7zw~3h(so7$1_lsjg3=&1Ey0#UhA){nm0#yGT9DcA*N_ANCTu64
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/gr/gpccs_bl.bin b/nvidia/tu116/gr/gpccs_bl.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..e924af4d68e799def9b8afc6b24c67eba852f48b
> GIT binary patch
> literal 576
> zcmew$B5Tda009a>$^pb=0uc~k0%L$^kU|)SieF%0VPN>j!mxKqoq!3$52j9__>6g+
> zGv;&sWSTKsXxmec8FTozeUX?kOZe|U))^B-{(WNrtC`O+<tN9Ke>{KZvHqWb_1|r%
> zD9?<U+<Twwng78q%Y@<AJeD0Zfi~`V2PBrw|HAR{2RmG)z>JxK+rDyan<DXdKI^~f
> z412%W%{O7_V_;z0^KZhhpR7CngEamA!twqG^WHC=3>{3r=0h#P)Y{3=3zFWvfPrTd
> a_s^qtcT5<59^Jd-H!NtNz8$5|LjV8{YiBtC
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/gr/gpccs_data.bin b/nvidia/tu116/gr/gpccs_data.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..823b4f4ff04930794254fd82dc94515570d25f96
> GIT binary patch
> literal 2640
> zcmeH{A#77Y7{~wJj`p_Q%CTLRWqBEwrCA19LSZ8`1aYDX6%&XF1cHQ-ASQ}KR8&+{
> zASMxriIGeoCMOUTh>3}bi3!BS1OickKp^-X8wp|pgWF4f{oeb%*L!#0_uXs0d=caQ
> zc&~o9q58_hmBz!B2jci}ag_4K>k-LI{A%<s4CmQ#*n^VHNlESpv6~+<GS0|9AwGvq
> z*fDbZpt95hRT$OsXYf#m6F7yhR-qV^YGbmGh??NJ33d7tTH5D)2%Apof}7-im1nCm
> ztB|T%->#~u>v-M}nENW+=90(Nf(_^c3-HB=Or3>1g3p|<GXEAlfp?>Fd&HAbnc*n2
> zHL{U4G+0lQ1h76m&50<>dU#fr$!ps!%bAL_RFUfucZoO8-`C>VPPfebD#VJK*YGu1
> zhXI*8BMzlbyQIcmN&bi;oI*}RkGX8~KEpd0LxHgi^3{U_W@pHYVUhj3Q1W8QizN?^
> z_0PiglI#s`g~Ms(+U9rev2Me-)Jq$Tndj3jDeUmTM;LH^M*IfcR)9nJ!Zm-(M~IM^
> z^FUhu0pvAANF%rr9LV4x8JxiZ1BM8RoD9l1Aj=^_vN($ajpHDV<Hm77F++spa1ICb
> zL5M&PbOu!%&;ubt@;HwJP2nI-;ihoF!a{@;Z~+IJ!9kkA&EP<@I7qX&SsZ8%2WbvB
> zhXWNjNCmFIf#z|L=5g~lP{cusxQGKS;2<sF7H~k5gb1mItKmS4I7o}QMI3BU5ROpr
> zllLcO?`(lD5vgVFr$FHfpw}%uWh}L)Hotp|1~4AzG2f-&eR`Qb^TEp2fVvp^&F>KR
> zxTf!1Zcfi$O~m$?I>RyAiC+9PL8KSGQ_*&Exi5!KzC9^NZ~FJ={ptVoCv~!QCfx8c
> zE&sc1)nE-xSffQ>L63H&ua@6H?%g9ezJycU*(D5d-!Fk4)z3@Fdn4zmNqkD&gl*1u
> zfp3F3fV_9=(1JGKhOW`(kn`{V0Q<l=HeH1N1#gL&tqUx5sPTPiz#8Oz%Ftnn)E>Yo
> o`8lSpc~5@jJFLU$;tuXH@QDyw&0G9j9akB+%D`0y{!<2i0enu)z5oCK
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/gr/gpccs_inst.bin b/nvidia/tu116/gr/gpccs_inst.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..b56da8f70831cb12a83006e834062ea1881d1142
> GIT binary patch
> literal 12717
> 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
> H^bz*|@V`kY
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/gr/gpccs_sig.bin b/nvidia/tu116/gr/gpccs_sig.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..88221abd8fed81f06a48c4b6664a9a225f08c839
> GIT binary patch
> literal 192
> zcmX?8KfA@T;|@1hbB2pM>rB}{Npt>AJk$GT<(*gVn+|=EI~u8G_-DHd$L9Y<ndMn^
> z8RtHVCvORDoDgcjEHB+3bApk9fdPb>p)`n1OR)8j;Y;RC<=6R)7G(DOH6#H5awsQ~
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/gr/sw_bundle_init.bin b/nvidia/tu116/gr/sw_bundle_init.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..8f8ccd94c1d5095ca4ce7d05627dc54e0b6669ab
> GIT binary patch
> literal 7456
> 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
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/gr/sw_ctx.bin b/nvidia/tu116/gr/sw_ctx.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..cf297b939361f47134f903c52751b23ac8d8a80d
> GIT binary patch
> literal 6936
> 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
> DXLy#R
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/gr/sw_method_init.bin b/nvidia/tu116/gr/sw_method_init.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..641c132b0ee87e84c0850ba963656d693247691d
> GIT binary patch
> literal 13424
> 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
> bQ_uXA2f{?^x%xnu#&l*d$xLRkM9TjI=~|lF
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/gr/sw_nonctx.bin b/nvidia/tu116/gr/sw_nonctx.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..69219c08d5d921109a3d1db57776080094830e3f
> GIT binary patch
> literal 3856
> zcmb`}KZqh{7{~Ef<0Zl^VTvgv5n>Jt3kg$LctqIQAi=`IfB}<OSXgYag@q7{g}fnh
> znY%NIg@s8>kYHh9VPUbwlG|b-78VjLEG#S*Vqvk6Ew)&)d1l`4HL149tN5AU^ZuFf
> z9bweURewHqlqdf6>aBk|qEc_FuIL~2f={KAAy<VZJEGq*n8lp<cj&2d{Txy%PrV>o
> zl9elUrF8WuP&M#Od?Fp^WG`>}JJ>bqC3%HwF(&i2;_Vx9@NqCt=PG8tYt(u1{{CJS
> z$VKrh8D273HAMgNn%KfqjDBX;vp)~i>I;+eSi&0C@fc6AflX}TDQaw^haK!<5BoU4
> zA&zj26P)4<&+r^C@Dk^^z$LD5jT?;B%>E>eDkb{+nnnjRxU8FfT;UowxWy~n;U2Aq
> znV&#cY)10kf@nuoDB3dpjt<m0(Nc2XJy%7<vgo%8R<VW+qqd)$aWRZz0+X1+G&-0!
> z>Jqsu%Fj_%#EhKZ6GP!hv?E#xS1(_f^Q~}=8%+FW`jeQ#G&-2UEatF=4Q!&NkCfkR
> zjA0xTn8XyO(ZLL6F^4YZv4BM^VHqn}#TwS}7*DW)O>E&QYHXv29qeKc`#8WMj&O_<
> zoZ<}6@EkAj66d(UC9ZId8{Fa*?r@LSc!Rfihw5u{e<K*h1GLb_7{)PyNlalH9n4@B
> zbLe6o3s}Swma&3WtYICG@dO*##1@{S#x{D`!7lc&j{_Xy2zO|IWA-(U8O&lEJ&d-^
> z_=Hgpjc(+bscW>qHQDxzF^pr<sN3W@E^rwbQY$eO4k`6KSVvo8NM5$DJU3%OT`R}*
> zs|>oR#V@6`(ZddQv4?#e;1EYR#tBYwhG%$=7kG(tT;LK{xW)}`@d|gi$7{U7TfD=_
> zOSAuxj?qFJV;IK-CNYI+^iX|g){A~`9Eeu<Jr(`I<b$p;hAE>ikc(JGt8d0<MR~la
> zJh>zW&pUDj+eWQ_H1pcn!y%4vj1!#V3@`8!SGdJ1+~FRt@dl?qnd@2N>Va+<clAK8
> z8F%wQZy9&@KqEhMKQQMj@4V>9{i&F`Tcy8-C)69{CXU6&Z$EoyCVu+KBQ+O4dht{(
> z=sy^k^ErWsszBa}Ph54l7Zc(4C)d<({wHr)=MJr3j+8CmFCiZKzeCY)1u^tU{(q6n
> zz9HEMzb^e%F)Y@|Ex%uy_a8gt*LKOTT}bxVOa2<ncT+}{#w_(5*~KFD61j|ZjQnn{
> zCn_do{R1&7TH+rsKm5R^KZaSOp5uc0>XpBaR+~UMe77JUN<}b=2WX*<F^ppZlbFIZ
> zI+(#M=Fr7F7O;pVEMo<$Si?FV;|Vsfi7h-ujcxR>gI(-l9|t(Z5sq<!Q=H)$p5p~x
> F;=jipnyUZ+
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/gr/sw_veid_bundle_init.bin b/nvidia/tu116/gr/sw_veid_bundle_init.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..a8d59ef22dfb73ede7d0cc89ee573eee7d5b71c4
> GIT binary patch
> literal 176
> zcmXZW!4W_(5QX6vW=!M~J<y02xG=*NM-)J<Dv5-D5Btr&J?yHItfaP#E!Ks1(nwSO
> n#hTH&e=gBs$G*n_N8ItiGa7=|!o1>^axc}zf2Tn`CcTrr1u6=<
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/nvdec/scrubber.bin b/nvidia/tu116/nvdec/scrubber.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..485b910ce2c94c18319cd588f0842d6fd1188c2e
> GIT binary patch
> literal 4352
> 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
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/sec2/desc.bin b/nvidia/tu116/sec2/desc.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..9f2a6e4cae49bbf0c5344a256e6535a765bfc06b
> GIT binary patch
> literal 656
> zcmeBSVqjo+$H2f0q->_IVhm4BQE*F5QZQ98w6HQX0U`w>10w?kpfu570wYlAUnmBd
> z{{~ZQiab!vn}K0ZAOiy%kjV;Cq5u@)0b(5nhV4LoO!^EA#q10WrDhBa3xLw1<_rvi
> T!VC;*UJML3fc#M~{6YW#zvmMl
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/sec2/image.bin b/nvidia/tu116/sec2/image.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..a13e762e2c6b1a9284694b0a1431e8cbea8d5ecb
> GIT binary patch
> literal 60928
> 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
> S5wH=k5wH=k5%}LA@c#l*{Eun?
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu116/sec2/sig.bin b/nvidia/tu116/sec2/sig.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..93816a065a59e945405d1fb9e33854d45a9701f0
> GIT binary patch
> literal 192
> zcmbPyuAj-h=FT;#@4MH|YkV$s_2$3mFU41X+&lDBJ^1>QX^QW@noRedF5Xx-<K!^|
> zM#Bi<#sCJ7Ur7P-`XvGTR1Y&UFff2HJCug8fm{YIs2GT5g0h*RGz*XhiNi2VKTrrS
> V*m%hBCG)28>wHEFGW-1+k^l^tDarr<
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu117/acr/bl.bin b/nvidia/tu117/acr/bl.bin
> new file mode 120000
> index 0000000..888d361
> --- /dev/null
> +++ b/nvidia/tu117/acr/bl.bin
> @@ -0,0 +1 @@
> +../../tu116/acr/bl.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/acr/ucode_ahesasc.bin b/nvidia/tu117/acr/ucode_ahesasc.bin
> new file mode 120000
> index 0000000..346b514
> --- /dev/null
> +++ b/nvidia/tu117/acr/ucode_ahesasc.bin
> @@ -0,0 +1 @@
> +../../tu116/acr/ucode_ahesasc.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/acr/ucode_asb.bin b/nvidia/tu117/acr/ucode_asb.bin
> new file mode 120000
> index 0000000..f3c6b7d
> --- /dev/null
> +++ b/nvidia/tu117/acr/ucode_asb.bin
> @@ -0,0 +1 @@
> +../../tu116/acr/ucode_asb.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/acr/ucode_unload.bin b/nvidia/tu117/acr/ucode_unload.bin
> new file mode 120000
> index 0000000..19db442
> --- /dev/null
> +++ b/nvidia/tu117/acr/ucode_unload.bin
> @@ -0,0 +1 @@
> +../../tu116/acr/ucode_unload.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/acr/unload_bl.bin b/nvidia/tu117/acr/unload_bl.bin
> new file mode 120000
> index 0000000..384d358
> --- /dev/null
> +++ b/nvidia/tu117/acr/unload_bl.bin
> @@ -0,0 +1 @@
> +../../tu116/acr/unload_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/gr/fecs_bl.bin b/nvidia/tu117/gr/fecs_bl.bin
> new file mode 120000
> index 0000000..bc2f0f5
> --- /dev/null
> +++ b/nvidia/tu117/gr/fecs_bl.bin
> @@ -0,0 +1 @@
> +../../tu116/gr/fecs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/gr/fecs_data.bin b/nvidia/tu117/gr/fecs_data.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..ec6b3a15f58efe3493de2acc761caf827de01ecd
> GIT binary patch
> literal 5256
> zcmeH}v5(ti7>9os+|&dsvLY*F$l$?4kUFI3M4`IjcPPqrKq$ivNAHG6ggtB-GGyqG
> zs~9>kbj+Pfbpw9@Lx+qV^CuuA_Kpk;JYOy$89*l%gpj}J@%#Dl>(9<BTYh`re4Xcq
> z`N!RdpX%YG$A_Oh?tUi551S#SItb$1N|>(a%oM?U8^Zo}zKy|!^Irb)p?-un5LFy!
> zc5-9qD?95RJ32kKhQ#lQi(@BC=Bs1J>F17K_N=Jyqy-Q9j@-9SVF;7HpS<lm)(LB#
> zxYIjftrJUUR`<;DDe(gI6+Cs+g6P~zAwPF^6yngj897~!ocum=s~B?+V;@BmE17uu
> z-Nc<Y%r$d+G_%GtXPP_q+>tIFe{pF|FCD#IaNd=Z*=t`MNopl&{47az!G9WX4>9*J
> z;CcnuOSwkOnnz*1Yt~Vb<-pPDQpJPcKouOgf~(*_5e^*TA{?lS16OfX94N+tV_b{_
> z)o|b%u7(38IB<eXaG*L4T*uXMpcDsAaVZYez=0dM1`d?rz!@&XftomQ6W7FnS~#HE
> z(`5?>niW}lR_IG=r$wO{(nZnnqKF4DTolO*c!k$hk$0|$uZ#GDkS|d`Q9n^XQ9n^X
> z9Jqq3;6M=$s5te*fvPxg6<5W9VjS>fQ9m50h6C4dH5@3xffHPU1J!ZhI<Afb-WlqL
> zOK~X<)WCroxCRcC;eaQM`r$xL9Jq;V;vhU<jI7P30v#CKgZuD4P!x98FJE~7k~z=Z
> zrSoSzui@R)tQ=(p$_kVf_^($$|LP6?-PQKIX171?D@@j5r-I!2aO`&M5^vAg&nH8h
> zwDmOP?tbg(?(ll1a0VO3UgCOxU+j))KQZV#Mo54V{&IvR!tai;O<Jdtz1`nTHu}$S
> z$7=ulFrT?!t73h=rU!IZ&^>TV_xKi8Et%es-fRp%(Qm$^@0|A>ui$5TPW9=}&YTU;
> z+@^O+3i`L~DV`p#2cef6o_qT4oUi|o{*=Cs-Y#8@+}7A>K6YgKyeFGpZ#i+&rQf6H
> zOH+Es90qfzV`7i~alp6vhPZ^;b0VysJMjy0uiYMA-}Z`!l6oJpDMwj>vI1oV$_kVf
> NC@WA_;D1noKL8hxI`aSk
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu117/gr/fecs_inst.bin b/nvidia/tu117/gr/fecs_inst.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..1d937647a070ee6cdd34eef618bb6312d3e8c064
> GIT binary patch
> literal 28783
> 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%0DT~N$qP(O5*q)~_6REQ
> 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
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu117/gr/fecs_sig.bin b/nvidia/tu117/gr/fecs_sig.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..f16cffba3c2f01da7ed8978cec4f5271d5a7aa07
> GIT binary patch
> literal 192
> zcmbOzxIv|53Zq%!<>_*d=NE~roa<O}GtKK$@5<)AFAHY(SPAqmxZieLUVWXRi{8=}
> zl_^Po+t~G;PpR_Ey8nW&rht)wfdPb>pfre0OR(jT;Y;RC<=6R)7G(DOH6#H5Fj6JC
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu117/gr/gpccs_bl.bin b/nvidia/tu117/gr/gpccs_bl.bin
> new file mode 120000
> index 0000000..fb8c01a
> --- /dev/null
> +++ b/nvidia/tu117/gr/gpccs_bl.bin
> @@ -0,0 +1 @@
> +../../tu116/gr/gpccs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/gr/gpccs_data.bin b/nvidia/tu117/gr/gpccs_data.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..90e5710e823f3680249402dd7484bf9f5d9bcced
> GIT binary patch
> literal 2640
> zcmeH{A#77Y7{~wJj`p@4<=8IEvb>DT(kz86p<5bg$i#^zR3H!t1cHQ-ASQ}KR8&+{
> zASMxriIGeoCMOUTh=~aVVgfNSfk0GDAQ1cxMuM2Y;P#SVzxRIc_1@k0efQeWpT*dW
> z>y5RR*6!YG-nqBFE{=ESM=4*toRGZ4uO|P(aGo89JuJx_m*l<^`}rXw<Ba@6;#1gy
> zT_bk@DoX=Ug;6bk1`iE5h7<T|6^bdTHYK}3)C|wfs5hKZ{ebf^Y&oe9?ke}IJX@7%
> zLaOS~PE~DP!}Er~+?#NVOCDDTHem=Xz!wuT4HmKiA31L_{|-EaH<NPv#N$bs@g%b~
> zvXM2kSWlY-us%J`i73l@cv6<hYuhW!nTk}e$PI{l#2dfg*WuY-zs&q9#ERNi@HKb@
> zBQkeN980}!Nv-{o{3nWV0yzx>=CZ^44DVnJ1;#GO*8mQgogpuVMGo^q$%`c~mOMDt
> zzW_UR+3Va2M{~-x&F|c2-G*_gmo^zQ&!=Bf*yVxuFyj1__zk$N07vkJYyOsx5Fs(=
> zk+k|9$ZLp@CU6rtkikJRID-QQ3=tAJ8I^HBmP3SOaTW)f#zC6KP2+%Kh6u^w91iG%
> z5P=@(jjA}H2SSA8aUKVn#X*|I&EkNCg$OC&0uD5fgEWtu$AK1bkQQ(YIM5;v(jsmV
> z2P$xo3S5B$E#V+7;g)cqh=UYy5eHhvL0ZNw<A5d!5mF6T!+}<CkXCRjIM}2h9HHPR
> z?@!9!+Xi1EQp?;=fx;C)uUmS`SZYsge)Sd&U_8)czE8o2^fG<sgO#lTbusjt-zDyI
> zP2aiPoSwa!h}|jm##6Ktz4&2<NH2P)qU+>xUyhx8_o^Jd>EHhDPyeSssgrFm;g*-_
> z_+M?S7Heq316uS23}{#SYV{T5-u(ohFW>}sdI4kH*#*#}`f&kyZ{$3+iI0g}u*3Nt
> z@NF=MkoQglI?(0Y&^Ou|bAI*@un&x5(?uAb^O~61KF3mr8sC=|Jb=7U89LNS?IE0y
> npU>1a@5!%xhjlbp+{WDpJ`qBzeUqQd<1z!68Mw^Af6Bm5U8T*t
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu117/gr/gpccs_inst.bin b/nvidia/tu117/gr/gpccs_inst.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..c1e5f6ac1a6c62340e2ca600943ae157115e5475
> GIT binary patch
> literal 12717
> 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
> H^bz*|?IB4f
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu117/gr/gpccs_sig.bin b/nvidia/tu117/gr/gpccs_sig.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..66ac5590e4043634f710096a65a02f65f68d0a72
> GIT binary patch
> literal 192
> zcmdnSQoZF_d-?&!%qK~<tJj7Xtz{C;$=>r`^KYtA^{2DOR$d%aWzR+jPx797)osoF
> y`y5QK*y{Ewvg$ZUlnQLU+rY@czyQL`P#VOhCD?k%@Fnx6^6Pv?3o`rt8j=9Je<aNS
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu117/gr/sw_bundle_init.bin b/nvidia/tu117/gr/sw_bundle_init.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..8f8ccd94c1d5095ca4ce7d05627dc54e0b6669ab
> GIT binary patch
> literal 7456
> zcmdtncX(Ar9>(zr1V}<js3xIZAoMDzOXq^PODFWuqpOIByEKu`1q6a3QbUK(J0ygX
> z(0lJiX^My<y(wMIzQ6EgAD?|5AN+eyGWnc2XWE&WbLQL|7vfwR=UhU1=d#L`()l^J
> zR0_9(_~Z=E9aVh1wBr+Tnza0}#3$ja0nYjB_yXedaSqPI(NamByX2Qzu2Xv~9;iP$
> z<+5b7lg<TW2(}A+e%wFExfJbY&~a-=khJy%S~~3nU?oLutNa{S1$(8{j?($0<*Sq0
> z80YF@J*<xnupu_W#u$lBuqigf=GX#TVk>+bLop1)F*oMHyqFL3V>DK@PSloF{bXB~
> zUCw!I=MVjD*Zs2o`(t_=*Wu}$t0DVn94!A+1@p0jb?H)_xA9n`5Tk7^uEX^>P>F4d
> z^^@6TCl%gQCMsBYy(xc~&fEN~&b+LO)uh!^g?J^b%<*F6FODU!B$mR`SO&{tD28D;
> z=Egjj7xQ6$^hj%80W64xFair>5iE)!()uAQX2a~519M_7d<7l)VH!+}{+JHaV+IV6
> z*8V^Y!i<;+Gh-GE#w5){Ykx9sz>T;GH{%xEiWM2pu2Oe;%14-@d2Lg=OKRMCKg2rH
> z>Z^<Ous$}xhS&%j<Kom>oQqRjQ}{1GhidA2Z5xDxO*N#Q-3;2=V*vMIAO_(@RptqE
> zE?VilN*|@5E^w`}4YtL0*d9AzM~swqzf@DO{-~%hr1SFNtI{6K*YG;tz?*mrZ{r>8
> zW2%jPu^;xw0XPr`;b08VWU}@IVi0D;Oqdz7U@%5$T!NMV#dAMYZL#vw;xe6A(m!3#
> zmg~Gv=U=RAoz)lmbs3dETz;%^^T=}wR_@E5i;a}t>f1#6cT~RRYo+5V(k-D~OEFGb
> zdVf0^;whI-dLyH|rI#^N7AIwp`_5c_9AxKHQk<XZd^LKgJg@e8%2KLepv<KB0FGCZ
> z(LSwj(%(PCRgsqAg65UACkyw}Ftty=?vjF*TKBSb{SET{@B03;F2c&aj}Pz>{?+y0
> zCb?arAEv>y=#S|zD`t~6ZrP<>PY$VHms5Xi$uG}1RFG<tdrewBuS?5!g?65ze|F%T
> z%I{NAwNlITx&<76sOODc@1MO#gz7#{Q3YWbj=3=p=EZ!NA6KhvD}T0vhTYA<IGl?w
> z-dFA_pQXHq_wi@^1s~u;e1wnj2|mSV_$&T~zheq|tdmuL0W64xFair>5iE+uusD{$
> zl2{5$V;L-qks24PzX>+QX4o8CU`uR;QP>*WU|Vd5?Xd%P#AtjQ-@$+4yZ9b<!uPQ=
> zet=!@L+pwl;lJ?Tcuv}L&}a9#wjnqahvBC<97o_tjKNX(8GeqV@e3S-U*cFChvRVq
> zPQ*zVi<5B*PQ__B9cSQ7oQ1P74(H%poQLyq0WQQvxEPn<Qe1}1aRsi#RTz&6xEd32
> z4X(v?xE_-*88_fY+=QEP3vR`2xE*)kPTYmNaS!greYhVF;6Xfuhw%s=#bbCJPvA*B
> zg{Sc={2I^TSv-g5@dAE>-{M954lm*Nco~1dAMpzQgjewzUdJ1F6K~;dyn}b~9^S{F
> z@fUo65AhK`#wYj`pW(0g8~%<dcu>y)ThB6S?XmSEjCIaOys0gE+L~c2jz<x1jsLHo
> zdv9vp4h$<^>6Wb9`h&i=<*2DklJCg<XRkfED?`dVcTYC&t@jx@Mg4U_TE1_j<@;7z
> zzKhcGU6q#anzVe^rR6(s>!Swbtn_O4RBGJoPD>k~7oWpdDZRa~#N&(aK}ITW-?P-#
> zxTIB%jT%pjFHuNI@pHWtw{kjY{6oCCJRPM+@e!H_UO7zq<WTIc^Hxtc#<@H8kSQs_
> zt`qV1v9lf5!qQUpsH7T)@qyZ9@#e%^U@QEDcEqaQ@ez8jlxfoh1gwx&{}kz`H?c|5
> ztDj?bJS5a}Tox-=(R)JHiHwRqDLZ%T<13U}u5%GsL528g*Y-c6cuYk15|yky+lG59
> zOP_W}SlrL~s;27as+rE0#;f;*7TRiJEqoJe<6HQ5{0G*-x>yhEV*_l6jj%CBViRnN
> z&9FJPz?Rqwqp&r$!M4~A+hYgpi1C_tJ;rnyogmMrKT&_REctHcXNhuuSkFFd<XdAJ
> zzqeLajm<N1oosX><AU{aRYFYTB-uYUDkxc&t(GU>26;NPW9&v5UTfs}O)|^QV0SsS
> z`<)w`#`@j4aX20);6$8+u{as0;8dK3({TpQ#925S<C(_^xEd324X(v?xE_-*88_fY
> z+=QEP3vR^~y7ub2LE~u89Gr{ua6T@;g}4Y8;}Tqo%Wyfaz?HZPJ$eS&RsaiPA&kJn
> zSOkk=F)WTHuq2kk(pUz|q9^tKQ~g*F3t<En#v)i0i(zprfhDmNmc}wz7Pr|$N85JX
> zfje;*?#4a17x&?QJb(xB5FW-OcoaQ)j-AoH5hC>*s*x45VRp=cIWZT$f}t3O;g}oq
> zU|!6J`SCj$l3Abk@q4_CKj4pe1%JY;cnz=P4ZMlB@HXDTIOf9~oQv~tJ}$t8xCj^H
> z5?qSQa5=8PmADGyF#%U&BCf%;xDMB25+>sY+=!cSGj74HxDB`C4%~^ma5wJ3y|@qe
> z;{iN~hwv~S!K2t!+WSH`;@z<a_QYQJG4{q!un+dde%K!e;6NONgVBdWa3~JLPjNVo
> zz>ye(qwq8Q97p39I0nDOu{aLL;{=?DlQ0%1;}o2V({MV@z?nD;XJc{Q4>k@p^?dN@
> z)yFFXoY$4paeEVc70Y7<d<|d6H}G#*5i4P3tb$ds8dk>|7^(LuYgcc@Z3*iy?K|hp
> zdUn~X*Kh^9gdqx+E=Iu)j5U?P-g*7>MPmH+=if&p;A%|7HMkbn;d(rV$MFQ7#8Y@0
> tzrwFEN!s_@M=@E(?0Nd%|955IrMR{nm=kkhA!+|e^hiHHT_yh?`ws-6PM!b&
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu117/gr/sw_ctx.bin b/nvidia/tu117/gr/sw_ctx.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..cf297b939361f47134f903c52751b23ac8d8a80d
> GIT binary patch
> literal 6936
> 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
> DXLy#R
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu117/gr/sw_method_init.bin b/nvidia/tu117/gr/sw_method_init.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..641c132b0ee87e84c0850ba963656d693247691d
> GIT binary patch
> literal 13424
> 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
> bQ_uXA2f{?^x%xnu#&l*d$xLRkM9TjI=~|lF
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu117/gr/sw_nonctx.bin b/nvidia/tu117/gr/sw_nonctx.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..69219c08d5d921109a3d1db57776080094830e3f
> GIT binary patch
> literal 3856
> zcmb`}KZqh{7{~Ef<0Zl^VTvgv5n>Jt3kg$LctqIQAi=`IfB}<OSXgYag@q7{g}fnh
> znY%NIg@s8>kYHh9VPUbwlG|b-78VjLEG#S*Vqvk6Ew)&)d1l`4HL149tN5AU^ZuFf
> z9bweURewHqlqdf6>aBk|qEc_FuIL~2f={KAAy<VZJEGq*n8lp<cj&2d{Txy%PrV>o
> zl9elUrF8WuP&M#Od?Fp^WG`>}JJ>bqC3%HwF(&i2;_Vx9@NqCt=PG8tYt(u1{{CJS
> z$VKrh8D273HAMgNn%KfqjDBX;vp)~i>I;+eSi&0C@fc6AflX}TDQaw^haK!<5BoU4
> zA&zj26P)4<&+r^C@Dk^^z$LD5jT?;B%>E>eDkb{+nnnjRxU8FfT;UowxWy~n;U2Aq
> znV&#cY)10kf@nuoDB3dpjt<m0(Nc2XJy%7<vgo%8R<VW+qqd)$aWRZz0+X1+G&-0!
> z>Jqsu%Fj_%#EhKZ6GP!hv?E#xS1(_f^Q~}=8%+FW`jeQ#G&-2UEatF=4Q!&NkCfkR
> zjA0xTn8XyO(ZLL6F^4YZv4BM^VHqn}#TwS}7*DW)O>E&QYHXv29qeKc`#8WMj&O_<
> zoZ<}6@EkAj66d(UC9ZId8{Fa*?r@LSc!Rfihw5u{e<K*h1GLb_7{)PyNlalH9n4@B
> zbLe6o3s}Swma&3WtYICG@dO*##1@{S#x{D`!7lc&j{_Xy2zO|IWA-(U8O&lEJ&d-^
> z_=Hgpjc(+bscW>qHQDxzF^pr<sN3W@E^rwbQY$eO4k`6KSVvo8NM5$DJU3%OT`R}*
> zs|>oR#V@6`(ZddQv4?#e;1EYR#tBYwhG%$=7kG(tT;LK{xW)}`@d|gi$7{U7TfD=_
> zOSAuxj?qFJV;IK-CNYI+^iX|g){A~`9Eeu<Jr(`I<b$p;hAE>ikc(JGt8d0<MR~la
> zJh>zW&pUDj+eWQ_H1pcn!y%4vj1!#V3@`8!SGdJ1+~FRt@dl?qnd@2N>Va+<clAK8
> z8F%wQZy9&@KqEhMKQQMj@4V>9{i&F`Tcy8-C)69{CXU6&Z$EoyCVu+KBQ+O4dht{(
> z=sy^k^ErWsszBa}Ph54l7Zc(4C)d<({wHr)=MJr3j+8CmFCiZKzeCY)1u^tU{(q6n
> zz9HEMzb^e%F)Y@|Ex%uy_a8gt*LKOTT}bxVOa2<ncT+}{#w_(5*~KFD61j|ZjQnn{
> zCn_do{R1&7TH+rsKm5R^KZaSOp5uc0>XpBaR+~UMe77JUN<}b=2WX*<F^ppZlbFIZ
> zI+(#M=Fr7F7O;pVEMo<$Si?FV;|Vsfi7h-ujcxR>gI(-l9|t(Z5sq<!Q=H)$p5p~x
> F;=jipnyUZ+
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu117/gr/sw_veid_bundle_init.bin b/nvidia/tu117/gr/sw_veid_bundle_init.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..a8d59ef22dfb73ede7d0cc89ee573eee7d5b71c4
> GIT binary patch
> literal 176
> zcmXZW!4W_(5QX6vW=!M~J<y02xG=*NM-)J<Dv5-D5Btr&J?yHItfaP#E!Ks1(nwSO
> n#hTH&e=gBs$G*n_N8ItiGa7=|!o1>^axc}zf2Tn`CcTrr1u6=<
>
> literal 0
> HcmV?d00001
>
> diff --git a/nvidia/tu117/nvdec/scrubber.bin b/nvidia/tu117/nvdec/scrubber.bin
> new file mode 120000
> index 0000000..6ce6040
> --- /dev/null
> +++ b/nvidia/tu117/nvdec/scrubber.bin
> @@ -0,0 +1 @@
> +../../tu116/nvdec/scrubber.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/sec2/desc.bin b/nvidia/tu117/sec2/desc.bin
> new file mode 120000
> index 0000000..61ffd78
> --- /dev/null
> +++ b/nvidia/tu117/sec2/desc.bin
> @@ -0,0 +1 @@
> +../../tu116/sec2/desc.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/sec2/image.bin b/nvidia/tu117/sec2/image.bin
> new file mode 120000
> index 0000000..2d523bf
> --- /dev/null
> +++ b/nvidia/tu117/sec2/image.bin
> @@ -0,0 +1 @@
> +../../tu116/sec2/image.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/sec2/sig.bin b/nvidia/tu117/sec2/sig.bin
> new file mode 120000
> index 0000000..5bb9cb7
> --- /dev/null
> +++ b/nvidia/tu117/sec2/sig.bin
> @@ -0,0 +1 @@
> +../../tu116/sec2/sig.bin
> \ No newline at end of file
> --
> 1.9.1
>
>
> -----------------------------------------------------------------------------------
> This email message is for the sole use of the intended recipient(s) and may contain
> confidential information.  Any unauthorized review, use, disclosure or distribution
> is prohibited.  If you are not the intended recipient, please contact the sender by
> reply email and destroy all copies of the original message.
> -----------------------------------------------------------------------------------
