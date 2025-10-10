Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563C9CCA476
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Oct 2025 11:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23A25C4CEFE; Fri, 10 Oct 2025 11:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF3EC4CEF5
	for <linux-firmware@kernel.org>; Fri, 10 Oct 2025 11:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760095712;
	bh=oDlKQ+foBtJ3Ix5t3g4KTzQS5ujPqFvZWlgHu5w1+Dw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=JoQupXIvg+bsBnV2nozLoYLWDLiQmhUwL5+kx5IDGuCTdkhNJfBGQtW5c6cUswYcd
	 7YrAP2HwfJJBYSSIbA211rzu9ixIY74G+SZlC/2j7qcs5GjFumIyFWeHCZQqkRy1jv
	 kY0D674LiudY2nWgGCJNq2Ytmie9GvO4BJKvD+q6KsPfWodRilecmFxKVcmT0J0tLE
	 k7WwUOQn0yqrtvBrZ8OIjUqO6YXyjwE/+gkyCKLJ4v+BBsoG2nkTEEiyedbYoRLllE
	 b0n7EcwSKx8hiokJtzrRtV2HOOdUopMGV9To9wxfPhN21UycEoasy6TGHBo7jFB+7C
	 AeJevVIG+v/Mw==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-74435335177so46051097b3.0
        for <linux-firmware@kernel.org>; Fri, 10 Oct 2025 04:28:31 -0700 (PDT)
X-Gm-Message-State: AOJu0YzSZeHLNpiYVEcEv0wIaHGeHNMnxKTcfNCOWINxRSB4LE6vXUgB
	tA/IBrfUp7WFSb+yO6GLEWmTGkv0Epe55nZCwNdBmxbh1aNq3yhqVieZWEHGgYM0tH7LBbKVi1/
	PEIsj/EIn9TRLwVplAbltOBYyQi5Sg4s=
X-Google-Smtp-Source: AGHT+IFCv9wrNC/06zXxSNvexU2oGVlUCnbFzdXPygySz5I+6LUs4onJpZsDXUfBuUqij8Qp7Br6v8grFGIeKkOR+fA=
X-Received: by 2002:a05:690e:4252:b0:62f:ce58:62ed with SMTP id
 956f58d0204a3-63cbe12370emr12690246d50.18.1760095711192; Fri, 10 Oct 2025
 04:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <f54bf14f-f40e-43ee-91e3-fb3046605ed3@oss.qualcomm.com>
In-Reply-To: <f54bf14f-f40e-43ee-91e3-fb3046605ed3@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 10 Oct 2025 07:28:19 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4evGDckkKOupJ5k6OY=jOuTC6Nd+=uTbDGcbFLgoRjqw@mail.gmail.com>
X-Gm-Features: AS18NWAjSS6Fnrhx2cuwE-7MuoremL9jr47RySC6j5ykeqKvlqv7rlS5fJjX5fk
Message-ID: <CA+5PVA4evGDckkKOupJ5k6OY=jOuTC6Nd+=uTbDGcbFLgoRjqw@mail.gmail.com>
Subject: Re: qcom: add CDSP firmware for kaanapali platform
To: Xin Liu <xin.liu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 11:03=E2=80=AFPM Xin Liu <xin.liu@oss.qualcomm.com> =
wrote:
>
> The following changes since commit 46a6999a2d14a5f2239e7e712e5bbcf543f590=
34:
>
>    Merge branch 'robot/pr-0-1759560666' into 'main' (2025-10-04 21:36:21
> +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> knp-cdsp-1010

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/730

josh

>
> for you to fetch changes up to 08c86848b7e201ef33b0265e5910a07e97e5ec5d:
>
>    qcom: add CDSP firmware for kaanapali platform (2025-10-10 10:43:11
> +0800)
>
> ----------------------------------------------------------------
> Xin Liu (1):
>        qcom: add CDSP firmware for kaanapali platform
>
>   WHENCE                      |   4 ++++
>   qcom/kaanapali/cdsp.mbn     | Bin 0 -> 4956632 bytes
>   qcom/kaanapali/cdsp_dtb.mbn | Bin 0 -> 40760 bytes
>   qcom/kaanapali/cdspr.jsn    |  29 +++++++++++++++++++++++++++++
>   4 files changed, 33 insertions(+)
>   create mode 100644 qcom/kaanapali/cdsp.mbn
>   create mode 100644 qcom/kaanapali/cdsp_dtb.mbn
>   create mode 100644 qcom/kaanapali/cdspr.jsn
>
