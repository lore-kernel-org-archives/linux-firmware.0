Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E39C87FCB
	for <linux-firmware@archiver.kernel.org>; Mon,  4 Aug 2025 12:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ACA41C4CEF7; Mon,  4 Aug 2025 12:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F65C4CEF9
	for <linux-firmware@kernel.org>; Mon,  4 Aug 2025 12:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754310935;
	bh=wLS09WypSv1qY4yVdH2a2GrWAnLGfaRIL5LQ44lKRCw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NmWfcPdF2U//s22qN+TiGmdgtLlKx4Hic5AB/JHNzOMyfar127bskKC3hEGUTC+du
	 4LHuJ28cyWtPhRhaCCNi417/l3Va0y603OIgxEVm/ln6jXQpDmQlWGrB572iOytUBQ
	 l8SW74fBTU3SQhj+3Nl7+WPPQBc8MYASQJCbkqfLuVgcBQeEkBqe2Fk2sIhlC8ZM2x
	 h9KVmPpaO9TPZ/P6jtoBOg64jyfkFCbO2Zc1daBB2WMTYAcqwnnSkXDCL3kwoS17is
	 WO6vTIhgLASv+os+0Y+ZxMBua0RhZwtp7fd5td96NNhPLBeiwEwbyxWOGJ3yosPs5j
	 BevRKWXPqxXnw==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-71b6703ba32so32458337b3.3
        for <linux-firmware@kernel.org>; Mon, 04 Aug 2025 05:35:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXVMnI88457v8wWt/SM57yoATCOcNIgX4qqsDJDfZ5SWHRWO0hCmLi/F9n8HhplfIXlqnoIXa4U988D8KChg==@kernel.org
X-Gm-Message-State: AOJu0YyuUvkkSXXdJHY4BftmOR6OXgYjxLZq2wZUmeQX93K7PHctTD2D
	T+tAU1BYXZS7qxSast9T6MxF/A1THHAAXO6zoGqhEDDqfUUMVmvpV1RR2dS4mWXeXyShxXxcNr/
	SQmQtqer1x/ZvK3ZGxGcDJmuWhPRthGI=
X-Google-Smtp-Source: AGHT+IE9wZfYBftJKP5oTKJ7En/p55Hnwynlni0NrXSt5ekX/IBT9aYtUhPJNDDxrnqe3dgZn6Smwljf/EbKx6JF48o=
X-Received: by 2002:a05:690c:9d:b0:71a:234c:aaa8 with SMTP id
 00721157ae682-71b7f0c5533mr134514187b3.2.1754310934803; Mon, 04 Aug 2025
 05:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <IA0PR02MB9917670B5507A3ABE0A216FEEF23A@IA0PR02MB9917.namprd02.prod.outlook.com>
 <nxdmnhiysanfrebfwpbbvs3i64zcxvv27taqfflrmp6lyan3xz@fxpghuglviap>
In-Reply-To: <nxdmnhiysanfrebfwpbbvs3i64zcxvv27taqfflrmp6lyan3xz@fxpghuglviap>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 4 Aug 2025 08:34:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA55=tbks_aRp5dXoqzC-+a1NP44KPRvQ_eB13y5BNXWDQ@mail.gmail.com>
X-Gm-Features: Ac12FXy50bVzTzafeMw2SCBegIey270jihXumk-TZqJh3gdwAtbFUgti6Dw_fOQ
Message-ID: <CA+5PVA55=tbks_aRp5dXoqzC-+a1NP44KPRvQ_eB13y5BNXWDQ@mail.gmail.com>
Subject: Re: qcom: Update DSP firmware for qcm6490 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Venkata Kota <vkasinat@qti.qualcomm.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, Bharath Kumar <quic_bkumar@quicinc.com>, 
	"ekansh.gupta@oss.qualcomm.com" <ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2025 at 5:34=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Aug 04, 2025 at 09:08:26AM +0000, Venkata Kota wrote:
> > The following changes since commit 910c190740916a9969ad5105137fb88ae4ce=
34c8:
> >
> >   Merge branch 'intel/dmc/xe3lpd/2.29' into 'main' (2025-07-30 00:18:22=
 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dsp-fw=
-qcm6490
> >
> > for you to fetch changes up to 5d8fc0d700640138f1890e675c0ba3e80f8b6f9d=
:
> >
> >   qcom: Update DSP firmware for qcm6490 platform (2025-08-04 14:33:36 +=
0530)
>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/631

josh


> Nit: there is no cdsp0 on QCS6490.
>
> >
> > ----------------------------------------------------------------
> > Venkata Kota (1):
> >       qcom: Update DSP firmware for qcm6490 platform
> >
> >  WHENCE                |   4 ++--
> >  qcom/qcm6490/adsp.mbn | Bin 12079548 -> 12693084 bytes
> >  qcom/qcm6490/cdsp.mbn | Bin 3637248 -> 3637248 bytes
> >  3 files changed, 2 insertions(+), 2 deletions(-)
>
> --
> With best wishes
> Dmitry
