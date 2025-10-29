Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB56CCF9E9
	for <linux-firmware@archiver.kernel.org>; Wed, 29 Oct 2025 11:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9EB9AC4CEFF; Wed, 29 Oct 2025 11:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F8AC19422
	for <linux-firmware@kernel.org>; Wed, 29 Oct 2025 11:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761736664;
	bh=Ggg/3xUjWNBeBQ3OR1lJCDcuX4RcC68GgL3p5Hs/ejE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Gb5UR0zE7WshlE23tVQJXeAdOR2dqFFN/blFi6d9f1NUA3bgkEIc6uflT8jEP/Xis
	 JFRLh0P/XGMYxo0FER0wUmkm/Fw1tnzP9Nvku93WAR9nLGcurQiVxfpnPdYMsmkLCr
	 97AltcHgozUAWYAiBx+PRZgfTUtzbMDpZ4r1zu5Lq/wyXmAZAZeEGszRFlvJNDD/hP
	 e4Fkr94V2amPWRYlSE1lZ47U0VgNfDDqJ6OzeOlGB0otrgrMPsef6XfxUzob/P/07i
	 D5eiCPBKBKAklFtO90J4PY+Sb9/mv9Rs7OtHO5vZPZm5DeivUuGiYd7LA4jkQkmyj5
	 jjk5slUbnAi+w==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-784826b75a4so82132767b3.0
        for <linux-firmware@kernel.org>; Wed, 29 Oct 2025 04:17:44 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw+z0CPC2szmBq0INhRFcHdrfg40/XMPnepQSuNqOb6DjsIhHTn
	MwLOj6f3wUSjyJ89WCbZmaxwPJ0x9sKKZK61SglAD1hJ94+gT/LsXi7NWCaYNPEPDt3CeH+lGXp
	TKROd4waYCH3evyjkEd8/D1o4QUwPqhk=
X-Google-Smtp-Source: AGHT+IE570TpjxNwkI1UWamFW+qDsk8vj6E91r9UvBWLDeVyUBoKIGx3CjToWWJYh0xhwombFvVNe+ZT3y2RglPgAbQ=
X-Received: by 2002:a05:690c:6d90:b0:783:7266:58f6 with SMTP id
 00721157ae682-7862926fb01mr24642447b3.7.1761736663640; Wed, 29 Oct 2025
 04:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20251029091859.569005-1-max.chou@realtek.com>
In-Reply-To: <20251029091859.569005-1-max.chou@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 29 Oct 2025 07:17:30 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5Mt7Kgk+worsgp-RqexwBsdK0TKBZYDs98bx59BTFUYg@mail.gmail.com>
X-Gm-Features: AWmQ_bkdTUKMkOa5dZk9C6ktNKBm865HC5IbHwV371prQyYd9nZym5JJKHEndIQ
Message-ID: <CA+5PVA5Mt7Kgk+worsgp-RqexwBsdK0TKBZYDs98bx59BTFUYg@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Add firmware and config files for RTL8761CUV
To: Max Chou <max.chou@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Hilda Wu <hildawu@realtek.com>, 
	alex_lu <alex_lu@realsil.com.cn>, niall_ni@realsil.com.cn, zhu_qing@realsil.com.cn, 
	brenda.li@ublnx.com, Chih-Hsiang Wang <wangchihhs@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/762

josh

On Wed, Oct 29, 2025 at 5:18=E2=80=AFAM Max Chou <max.chou@realtek.com> wro=
te:
>
> This firmware/config is submitted for RTL8761CUV
>
> Signed-off-by: Max Chou <max.chou@realtek.com>
> ---
>  WHENCE                      |   2 ++
>  rtl_bt/rtl8761cu_config.bin | Bin 0 -> 11 bytes
>  rtl_bt/rtl8761cu_fw.bin     | Bin 0 -> 10296 bytes
>  3 files changed, 2 insertions(+)
>  create mode 100644 rtl_bt/rtl8761cu_config.bin
>  create mode 100644 rtl_bt/rtl8761cu_fw.bin
>
> diff --git a/WHENCE b/WHENCE
> index db7e1300..16d9ac10 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -4267,6 +4267,8 @@ File: rtl_bt/rtl8761b_fw.bin
>  File: rtl_bt/rtl8761b_config.bin
>  File: rtl_bt/rtl8761bu_fw.bin
>  File: rtl_bt/rtl8761bu_config.bin
> +File: rtl_bt/rtl8761cu_fw.bin
> +File: rtl_bt/rtl8761cu_config.bin
>  File: rtl_bt/rtl8812ae_fw.bin
>  File: rtl_bt/rtl8821a_fw.bin
>  Link: rtl_bt/rtl8821a_config.bin -> rtl8821c_config.bin
> diff --git a/rtl_bt/rtl8761cu_config.bin b/rtl_bt/rtl8761cu_config.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..018dcf93b1cbad5e865dfe6f2=
7598382c90b4973
> GIT binary patch
> literal 11
> ScmWGtt=3D!Ja@STB)fdK#%&jP6c
>
> literal 0
> HcmV?d00001
>
> diff --git a/rtl_bt/rtl8761cu_fw.bin b/rtl_bt/rtl8761cu_fw.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..475320d0bd5c982cc472422cb=
37d263f785a24f3
> GIT binary patch
> literal 10296
> zcmeIuF-rn*7{~GFPOGbys~{xQ^VGz^K(RUWipz^63fh$t9D*Ez93oDT@?|(Q1Z{$&
> z(Av;oLNt|uP$t2lWOrcLUuftp1i$CuyFBnLpWRIQ@Hn%d?KK>#orpN%$wq_U4YSMN
> zh;mhFOG?N|pM&$dwV>MmT(#U<tS^Xy?$VU*A_=3D-PQB(r=3DFL_Tk-IG!aT1k=3DW<<gv{
> zyUr_7mGk-|qd%_|Q9Ww+>%k(UWs>pAdS`vG3|5cTXIZR)Ii*b|gjB9pI+KZtPs6LS
> zF7RRTXr4mkV9}*ad)K~;;i*jGc!-wUgE;w<+t21oVNB%$cWuf{bk>RYao$IhZen?o
> zn;QqtRwWoR8nw4UL9CJ--<(!w&6!wHvDNuboYwNTrslk@1eZoW3<CoJ2tWV=3D5P$##
> zAOHafKmY;|fB*y_009U<00Izz00bZa0SG_<0uX=3Dz1Rwwb2tWV=3D5crn@!zf2P_V1G)
> DSQB)6
>
> literal 0
> HcmV?d00001
>
> --
> 2.43.0
>
