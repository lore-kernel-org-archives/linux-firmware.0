Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234BCC369A1
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Apr 2025 11:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E18E9C4CEEB; Tue,  8 Apr 2025 11:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB771C4CEE7
	for <linux-firmware@kernel.org>; Tue,  8 Apr 2025 11:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744111549;
	bh=cqWq/yG1PukgAZHVywed6vTviwi3RA+pa+a+k4rSiP4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=YLodKb8CUKb/BKkhxofqtiHTFU6ZujYwKY1yf9M7FwcGFcOQbb+XY0foNKDQWLJFR
	 zIU3zVLqqDjDpHc1yu1Fmc92Nz+ihQUvf8R6x2S2iYPT6rWIYhaClCp4BjAYAPz47I
	 TCdeTy962kx0qjn0XgxN5l5P7rgeizoR+QwrKtU/1XHiT5s41LoeDzvT3fInz08N7F
	 i754ScYBgsvc+8WCHFlOl5+qs4rK/3OEakcDtuggyMgvZE+T4HQDEM6XnFEs6ZwvHp
	 TAJ4IA40b7jKmOKTuMsOOhGl/MzUcrvDOrLolL/Z+fhiuKmBWGUn6ClrODVTXDYzFf
	 1Sv5/i2BVm14Q==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e63a159525bso3853492276.2
        for <linux-firmware@kernel.org>; Tue, 08 Apr 2025 04:25:49 -0700 (PDT)
X-Gm-Message-State: AOJu0YwVapSfCGbUbT+xpA2BWZKwAcwbfBP1gzkhcjeYFISa4zjpiEWT
	LfmmIsPCRapZUuACiKuGZptfaKBKI5yxXNqeJD62VoK6m5mapknELG45U5r0FQm8aslvyvqEz2l
	X/6erDvsl7kZz/ZxbzEdLQ+SMm5Q=
X-Google-Smtp-Source: AGHT+IE/iZYPL3BkdWsKABi7om6zQL3fSKnlKA9iWUaifavItEp8+5OXVN8CH7OF+jvYqVM6KfQDjmk7YC0YGij2gKM=
X-Received: by 2002:a05:6902:2383:b0:e6d:f066:4061 with SMTP id
 3f1490d57ef6-e6e318b1783mr18524628276.46.1744111549042; Tue, 08 Apr 2025
 04:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <1a511921-446d-cdc4-0203-084c88a5dc1e@quicinc.com>
In-Reply-To: <1a511921-446d-cdc4-0203-084c88a5dc1e@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 8 Apr 2025 07:25:37 -0400
X-Gmail-Original-Message-ID: <CA+5PVA66hBk9eDnoaX4VxOwz+obJ_Ewv8p0+NF9Hm=LPXwDRWw@mail.gmail.com>
X-Gm-Features: ATxdqUHOAzdJlxs1y0MEwYI5aCMnxk1nkwsr3BKEA-OddcHFML8w-kQeE6skWfY
Message-ID: <CA+5PVA66hBk9eDnoaX4VxOwz+obJ_Ewv8p0+NF9Hm=LPXwDRWw@mail.gmail.com>
Subject: Re: update firmware binary for SM8250
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 4:58=E2=80=AFAM Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> Hello,
>
> Please pull below firmware.
>
> The following changes since commit d864697fd38a94092b636c8030843343f265fe=
69:
>
>   Merge branch 'rtl-bt' into 'main' (2025-04-01 11:24:40 +0000)
>
> are available in the Git repository at:
>
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-fix-sm8250

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/509

josh

>
> for you to fetch changes up to e62b280a2126a30d78f9c8de482e61ddd6a37dbe:
>
>   qcom: update firmware binary for SM8250 (2025-04-08 13:11:21 +0530)
>
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: update firmware binary for SM8250
>
>  WHENCE                |   2 +-
>  qcom/vpu/vpu20_p4.mbn | Bin 1974884 -> 1985348 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> Thanks,
> Dikshita
