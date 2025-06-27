Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A83C7EE3A
	for <linux-firmware@archiver.kernel.org>; Fri, 27 Jun 2025 11:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC90EC4CEF3; Fri, 27 Jun 2025 11:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97532C4CEEB
	for <linux-firmware@kernel.org>; Fri, 27 Jun 2025 11:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751024247;
	bh=e0doJQppC1G3P8qx762J+QTf6IjsR3FgYWFiyXvgvg8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=m6DKvi1oA1/B6/d3PiOTtPUzG2r/kDH7C6Nv4GHLGhKyWqlnFtARnj288eYH+Igvc
	 KYBFP2MYzJFNP0vcdoMvSUN2xWS5ds35oaA/+ERBVTxxkD13UuY3H6ZhzBPlCYJp8j
	 2YvhP0m8fl4dmcSeIf7VC5gxhYRvBF21Mye9nQayi8S3p9OETOG88dGC083EiahjAo
	 9QfhZ6ShKjXusnXGl/kO/RaSnhYakWdSCSO8wfPzJHXEm1Ypm/XXwiX4UDhfFrbOnA
	 zPKIB0wryNfeqeNlV0p7L+hfbN3sT5R5TZfErFih4iaL69zJOi2+ses76OgvPh4Wjg
	 f9qE0nOKKFQiw==
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso1715998276.2
        for <linux-firmware@kernel.org>; Fri, 27 Jun 2025 04:37:27 -0700 (PDT)
X-Gm-Message-State: AOJu0YylLjUtwHYbEvhPUOJ/d+4sHyi0dj76eaYv9YsbpelsQMpof0iA
	Qo1/Z+klKUwCyjXfuq6sYewf10eUaoJJ/PB7aKsIL6orZyXmQxfyL6Rj5NIG4MiTr2UP5+7eWiy
	AlR5vj2y83clz4BCJ8zelLmPoRn7Bbso=
X-Google-Smtp-Source: AGHT+IEHuAR70o4Fil6Ttu4gBquGv3RAz8fx+6kAd8tyvkUohQWDjWbK3XyS+7drd19/x0qOR2u7PBl6CjvNkoHWRuA=
X-Received: by 2002:a05:690c:c99:b0:710:e8a8:771d with SMTP id
 00721157ae682-71517191792mr42626127b3.24.1751024246823; Fri, 27 Jun 2025
 04:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <ac8e04be-8354-ac81-307a-be95211ff32a@quicinc.com>
In-Reply-To: <ac8e04be-8354-ac81-307a-be95211ff32a@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 27 Jun 2025 07:37:15 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5ganzEJGiLgnqWjicG4nqjtrDKXx2sE0YPqQJQyYhfGw@mail.gmail.com>
X-Gm-Features: Ac12FXy4-T7xYsBflIlAJ4RmZN4ki0edio-dQcrg5-NgrqAVOGZ18bhhpiKioWY
Message-ID: <CA+5PVA5ganzEJGiLgnqWjicG4nqjtrDKXx2sE0YPqQJQyYhfGw@mail.gmail.com>
Subject: Re: update firmware binary for SM8550
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 7:29=E2=80=AFAM Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> Hi,
>
> The following changes since commit b27862c732f56f6c47940be08296c58df06e43=
cc:
>
>   Merge branch 'amd-staging' into 'main' (2025-06-27 02:05:56 +0000)
>
> are available in the Git repository at:
>
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-fix-sm8550

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/601

josh

>
> for you to fetch changes up to ebbcfe361cbf40149b463255d950afba43d45a3b:
>
>   qcom: update firmware binary for SM8550 (2025-06-27 15:03:31 +0530)
>
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: update firmware binary for SM8550
>
>  WHENCE                |   2 +-
>  qcom/vpu/vpu30_p4.mbn | Bin 2306664 -> 2318952 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
>
> Thanks,
> Dikshita
