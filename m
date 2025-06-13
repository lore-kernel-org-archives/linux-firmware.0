Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88561C61DB2
	for <linux-firmware@archiver.kernel.org>; Fri, 13 Jun 2025 12:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5ADAAC4CEF0; Fri, 13 Jun 2025 12:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450FCC4CEE3
	for <linux-firmware@kernel.org>; Fri, 13 Jun 2025 12:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749816960;
	bh=TPoGYAefjEi8RmbDdTUsAKsyZ4vfR5mO568FWCDrv0g=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ZbdZgYvVdl0/JKA4liXjtqt5CX1NqZlRLM/Po1YO1duFRheoYyxh9SsjgjfQ+2iuY
	 qiDCSwtdJr5HgyffEFobK3M5/UcuQqzLcoes5XUyUSg5au0gtxvl52OewMHU5cB5AV
	 1Z+M0K03HKaF36wclqVRaLVQpIP8IvyG6RsJ0XE2AnBfKgs8y0dwTs1iZqdmPbkzZE
	 rSeryHPe6+I2j0o++ySSpCpnq6GdGFVIoJ9LgB9jfcdMSL1/am03UmrfTBpiMn7zU3
	 RcPG+Syai/alGCZBiIML5u9dCx2DKT2ja8e8gVIl3EHVtEIkoIoKVMt0KK+rsOgp9I
	 dyNUudmDYN8Gw==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70a57a8ffc3so19231777b3.0
        for <linux-firmware@kernel.org>; Fri, 13 Jun 2025 05:16:00 -0700 (PDT)
X-Gm-Message-State: AOJu0YwHNM3y21mDQ9d9itiEczUugNo+Qhz9z3QBMegZIW4wd/ogUPk8
	wSfGI6JyqezEm/bnEsylWEDLPV+qh9rJFe9IjY43OF461C186Nnd6SePdAB+akfIurhqaD30alR
	jpOcl2rqHl2shliIZkF+os9HTKnEIBbo=
X-Google-Smtp-Source: AGHT+IEwzHRvCq50aRK0dmpqLLMiJ1UxtHihoGxOGudQR9XcKQoeHPKIejWEdXS+dDb6reqiwuYiqOnesq2pYOs1itM=
X-Received: by 2002:a05:690c:338f:b0:6fb:1f78:d9ee with SMTP id
 00721157ae682-7116364600emr46146217b3.15.1749816959497; Fri, 13 Jun 2025
 05:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250613071139.19299-443-nic_swsd@realtek.com>
In-Reply-To: <20250613071139.19299-443-nic_swsd@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 13 Jun 2025 08:15:48 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4a3aN_Ux7q1jXfEFNUPi2MXFdck5cNp+1L4x2Ag7ApgQ@mail.gmail.com>
X-Gm-Features: AX0GCFvhUnKdEw9VwQoANI4xaAaKDoMcU1gmwQRCSkFXXkopOBvz1nGv32CxR5M
Message-ID: <CA+5PVA4a3aN_Ux7q1jXfEFNUPi2MXFdck5cNp+1L4x2Ag7ApgQ@mail.gmail.com>
Subject: Re: [PATCH linux-firmware] rtl_nic: update firmware of RTL8153A
To: Hayes Wang <hayeswang@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, nic_swsd@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/582

josh

On Fri, Jun 13, 2025 at 3:12=E2=80=AFAM Hayes Wang <hayeswang@realtek.com> =
wrote:
>
> -rtl8153a-4.fw
>    version: rtl8153a-4 v3 06/12/25
>
> Signed-off-by: Hayes Wang <hayeswang@realtek.com>
> ---
>  rtl_nic/rtl8153a-4.fw | Bin 712 -> 1184 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_nic/rtl8153a-4.fw b/rtl_nic/rtl8153a-4.fw
> index b0c5e02354b1cee6f3849775b32f9fa39951afc7..a1d5745131421b933cd0ef9bf=
759592ae79d3f0a 100644
> GIT binary patch
> delta 798
> zcmX|<UrbYH7{=3DdoTFR-Y?P=3DAvoKXv_$YhRkj%Z_MXvvJ{+sxvB$Cg-+twSbJ(Wd^n
> zkb({IAfnJ2B{K|z|E`QCB)ViVU(uZGVoQv0(Tl}=3DZe#iG_|9Ac(}GKD;(PU6yuUo}
> zo9FqZY}9^e?%adZPd4BEdDGdcia)%$+fV=3DA`tbbgKW|mvoc?ErY}<T1*%5ARQna<}
> z0x2aBTHnwpH^@!!es}=3Db$^q;Gn5!+oXt+>-x`F^NR<tY|@~n5+Y{^dtY<udnQO*<G
> zy|X2@bI+IZx+Wzihh#aV$O;H#DG^DK)DwklB;O2<b#{GVV9hEnH+=3D@yt_Q9M?V`h6
> zW^g{NyK`<MI0F9Kf!fpzS}<!;Lat_{+~9NY(`B1?{PXe4zow^z-<`Bz;5LTbjH&q2
> z#L3yGvqom5=3Df{43??7*fe1pnZxq%ZA75DQ7Jg)h;WBg(w2pm8ae9r@X_3oo|xZr@g
> zf)#cMLyP-`GeS1X`D>tf{$~f{@`l*44lQ;}OU4hy;ztt)!Ad-&k$7Kbd$@gFUOkC_
> zqv;e>9eMKYfl*{*3CwryA3l(?kQm;d<A*_WNUc$e+iU)X0_HUGvsNR2;vo_kSCMvG
> zSpI^AG^_a^wqs{yMtVTMn25wf>LN0Y>}(5$%8Yb}MkgZi`)cGuo7il&D>AN&JU0~#
> zzV0q*n1-;mG9z7~eRK>hur;`s-cU2rMG95z3ivtOTW=3D^bZ?43U`Xn-IR;xaok<QYj
> zaGc&i^GqyRr08LK3oS4^=3D6v1KQTjD`RI!bogB}QsJM)>T^OH^j`QX%lcrR6zR~WSK
> z@D|a+y7r1?CTJcN^e8C?`3%{aRV+6_yNbf>stS5Nfzr;93VH*vm9(gW{t+n?9VTd5
> zRA~;PMQl(7-9Zct+O@#7;3_fw_VtX%4C9sb3Uaf5XGF6RgEoYgn64s?!3X;40Os@$
> v@lxtiyQSsyUMT`AOLUH5ewfGbs3lv?*Snn9Mf)ZpU+hqez1V^5HvZKA#<@W~
>
> delta 318
> zcmZ3$d4e_Na5Gz;k22%E*QMM1l6Nh=3D`^-0|>}bE_&*gkB3Y)~QC>53DSQwfbC+eCg
> zlo=3D@)80j0B>l+y`zyT8j1H%Ib28Iv@h97Ew7#3Lkv18Eq!^Ut=3D%t>UDxS0?eTZzr&
> zjf~PNrNv3{1&Jle8SzF2hL#4F29^xn|2ZD;JrI1L@<986@dK*|HWL>YYB3#S*vG&C
> zAsHDM7z`L07-ArXH(2~(XVCb=3D%n-yeiKmBS@<v8EH3kNTf}BLC$;tUCsSx9h4GrTB
> z7<xS!m>-BeFnBQe17n<{*#U;cISO-Bj1RC2vVLSp6!&20<bA**$o-Kaak?kRhv^;+
> voyrIJUI=3D+KN{habKfsWfF39qM=3D>WqHCr%JKVe)HcZI*x+U6&_ouv7p5hs<Xc
>
> --
> 2.49.0
>
