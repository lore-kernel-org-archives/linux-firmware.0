Return-Path: <SRS0=RymG=OS=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132F5C3DA49
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Jul 2024 11:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5BCDC4AF0B; Thu, 18 Jul 2024 11:37:18 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9EB57C116B1
	for <linux-firmware@kernel.org>; Thu, 18 Jul 2024 11:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9EB57C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e05e2b2d88bso715519276.0
        for <linux-firmware@kernel.org>; Thu, 18 Jul 2024 04:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721302636; x=1721907436; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gme3CQO/Yqxtuaji/DB7S+/smdWB0CpFOl94tfqV2eE=;
        b=j3jrK+mWpeFSbhLNLq5gqLc9zKtC9anE6FHcPjRQUT4KSzNHL18ufH0VjZ/lLA23gx
         0bSIQaG7wUsA4P6bfrdlqmAI5SKiebTRxkT6W5HB1fMLNA8Hs60i6t2BmwF5i3NJj1Z6
         JXR2kDonRMJ1joUiDCrzUeZJmJ3u1IY3/cCF5d2FSV02q6BVv5smvluEGoQCqWOdrm09
         Rl9dz5DGZimkU+pG+U3R4+pQ/Px9L3btvtWmD03iXZLQzPis4FjIaf4DhRniNmObgGOt
         QRWjJ2vEgWwFnFuawdVW0FuSWiNcL8hNa35XJLM2ue9/041UGgzFlddySU7/2BMJwLVu
         MwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721302636; x=1721907436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gme3CQO/Yqxtuaji/DB7S+/smdWB0CpFOl94tfqV2eE=;
        b=ZuM181ewUlQ7x2lZTe3aBtn4EDhVL6Fdgy+WFI+mJIPnzjXICBZIxEh3VPT7T6L87X
         YINLdK7b8E1oAA5bNJ+zL7as8sG7Us+JZgXKtRyrDCZ8hiC3ECFXV96cr4kvbEqr3vVl
         6t8fEDa2OvRvHCPeAm0+N1BK0PnZv95/h9GZxlVbr/JqeBpx0YKDyM8JzjIW76txUgw/
         nS93/obZTKwXFGOnFHcwvyfoLyBfRdhTWCXkmvfgtdOg6K30Qkvk0khfzX1gnrPYEIih
         gbHmwJ+jSy/v6MZ1oWF0uYXKsERW3AbctHCaxdfUAwq+7GR/amjk7u8qztbr3XRyul7w
         IWrA==
X-Gm-Message-State: AOJu0YxBZK/uRg+NjEdmOzuJkdZhQIRSKfpcZVdvB+mqqquCAsuvLcpv
	deSd6j1ZmYEBHnNr48Ci9fFDNGj1n2OKcDbAR/b9HtnUuJmOpD+1fVr7U2yUnusrB4L7V0NPiuY
	Cbri7FpAOP5dUwkC+9Hq34RYMhYgF+Y2+xb13ug==
X-Google-Smtp-Source: AGHT+IEK2ev9QPtrBKDzVLlsCGByk6yC63CaBBDnCdtvxdxEVyPX1rKNF762+ltBf4iC5q9xlQzJcBiOhNNRs0Vycjs=
X-Received: by 2002:a05:6902:1502:b0:e08:56b8:e06a with SMTP id
 3f1490d57ef6-e0856b8e2ccmr638562276.26.1721302636459; Thu, 18 Jul 2024
 04:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <1721300902-24242-1-git-send-email-quic_dikshita@quicinc.com>
In-Reply-To: <1721300902-24242-1-git-send-email-quic_dikshita@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 18 Jul 2024 14:37:05 +0300
Message-ID: <CAA8EJpo4OijebJ9n3TONnB+huT3+VkZEE9LCHETV8iWAYZXsdQ@mail.gmail.com>
Subject: Re: [PATCH] qcom: update path for video firmware for vpu-3.0
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-arm-msm@vger.kernel.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, quic_vgarodia@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Jul 2024 at 14:10, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> - Rename qcom/vpu-3.0/ to qcom/vpu/ to have common sub-folder for
>   new firmware files.
> - Create symlinks for firmware files for vpu-1.0 and vpu-2.0 in
>   the same sub-folder.
>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  WHENCE                    |   2 +-
>  qcom/vpu-3.0/vpu30_4v.mbn | Bin 2306664 -> 0 bytes
>  qcom/vpu/vpu10_4v.mbn     |   1 +
>  qcom/vpu/vpu20_4v.mbn     |   1 +
>  qcom/vpu/vpu30_4v.mbn     | Bin 0 -> 2306664 bytes

Ok. You know that a single instance of the file had troubles getting
through. Now you are sending it twice when it's not required at all.

Please fix your setup so that git diff / git format-patch shows
renames are renames, not as an remove-and-add pair. Git does that
_by_default_, so it's something in your setup that changed this.
Please revert to the default behaviour.

This is how it looks by default:

diff --git a/qcom/vpu-3.0/vpu30_4v.mbn b/qcom/vpu/vpu30_4v.mbn
similarity index 100%
rename from qcom/vpu-3.0/vpu30_4v.mbn
rename to qcom/vpu/vpu30_4v.mbn

Also please consider using GitLab MRs or pull requests instead of
sending huge emails with multi-megabyte binary patches. It's all
described in README.md. And I think it should have been added to
Qualcomm internal documentation on upstraming.

>  5 files changed, 3 insertions(+), 1 deletion(-)
>  delete mode 100644 qcom/vpu-3.0/vpu30_4v.mbn
>  create mode 120000 qcom/vpu/vpu10_4v.mbn
>  create mode 120000 qcom/vpu/vpu20_4v.mbn

Please move files to the new location and provide backwards-compatible
links rather than doing that backwards and providing
forward-compatible links instead.
Also please use Link: tag in WHENCE instead of creating symlinks manually.

>  create mode 100644 qcom/vpu/vpu30_4v.mbn
>
> diff --git a/WHENCE b/WHENCE
> index 5e91462..876f562 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5942,7 +5942,7 @@ https://developer.qualcomm.com/hardware/dragonboard-410c/tools
>
>  Driver: iris - Qualcomm Iris video codec accelerator
>
> -File: qcom/vpu-3.0/vpu30_4v.mbn
> +File: qcom/vpu/vpu30_4v.mbn
>
>  Version: VIDEO.VPU.3.1-0076
>

[skipped two instances of vpu30_4v.mbn]

> diff --git a/qcom/vpu/vpu20_4v.mbn b/qcom/vpu/vpu20_4v.mbn
> new file mode 120000
> index 0000000..56cdfe6
> --- /dev/null
> +++ b/qcom/vpu/vpu20_4v.mbn
> @@ -0,0 +1 @@
> +../vpu-2.0/venus.mbn
> \ No newline at end of file



--
With best wishes
Dmitry
