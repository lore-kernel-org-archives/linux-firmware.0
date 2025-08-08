Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA71C87FD2
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Aug 2025 11:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 242F4C4CEED; Fri,  8 Aug 2025 11:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDE5C4CEF6
	for <linux-firmware@kernel.org>; Fri,  8 Aug 2025 11:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754654238;
	bh=gDbJuhGVBMCuhRJnjZrDc88UAHeKip0grqPBvvC5FOk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=DK1KBKAmDiuwP3nliftoHmmb5FrF/0ZA98otEq8Oa7mPzFUQa/KaApoIWFKBQz6ve
	 t6WlF7gCqVKJGpmnz0wDLyDKXU0u3fv8EpbQhy4kjeAHc8SyvbkUjXaZABKx57CVxi
	 KRiFmUJaer+WrOO5lYvpPU82RoonkTelXnUAnDhgkVLceBbRrgJYdm1q6t1HaqxiDm
	 /kunYn2BNTSxtiyGge9QxG05HNPpYT+QMf2VdaXGOmtUUjPrC3cbRxSSLGfgIvsfl0
	 jwZx1oDzI3qEQI4DljFFH41smuf0sYMbyTjk5ZDWTbdVxJjo4Qx3gQ1VysRW0ex92N
	 P2U1fV0tNahVw==
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e8fdbd45e10so1646551276.1
        for <linux-firmware@kernel.org>; Fri, 08 Aug 2025 04:57:17 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy8GCjJoe91yo8NA4SviNn9IN1JzzdgmPvs+Btksv+K7n4GgWDZ
	nn8qruQqvYxP1Bz4dbztY+Obc9q+bjXST4e8JJV4iNwqY/aNx6vd6S3Qm+ub7RUNqrEtxjAt1RC
	L0QJnHGJXnNseY8kOr8U3TquHn5ZHPLY=
X-Google-Smtp-Source: AGHT+IEHmSliRwGPZOfchIyukX8M729b0Vdx6IMb/fL6Y5Dg7WF7ADG4fhUnZnqH2FJlYFxf7uMA8Y3eN+DwvU+t/b0=
X-Received: by 2002:a05:690c:6488:b0:70e:2d30:43d6 with SMTP id
 00721157ae682-71bf0ef4141mr31840307b3.38.1754654237242; Fri, 08 Aug 2025
 04:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <ee972bfa-38fc-45d7-b4f5-0dbb03b73fee@oss.qualcomm.com>
In-Reply-To: <ee972bfa-38fc-45d7-b4f5-0dbb03b73fee@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 8 Aug 2025 07:57:06 -0400
X-Gmail-Original-Message-ID: <CA+5PVA44KW8VtpCkAPWto8tU+uMm8AJQXPhsGFMeyM78aLBz2A@mail.gmail.com>
X-Gm-Features: Ac12FXwSty2bmQmZBNUNpXMM8wmBeH2lrg5wOWGYiB6KAYHAWsTcDkgWZ-Tqu6w
Message-ID: <CA+5PVA44KW8VtpCkAPWto8tU+uMm8AJQXPhsGFMeyM78aLBz2A@mail.gmail.com>
Subject: Re: [PULL]: Add QDSP firmware file for Qualcomm QDU100 device.
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 8, 2025 at 4:15=E2=80=AFAM Kishore Batta
<kishore.batta@oss.qualcomm.com> wrote:
>
> The following changes since commit d30c7b425f6d9c9e9f54bcafa99b375342b3a7=
74:
>
>    Merge branch 'robot/pr-22-1754588181' into 'main' (2025-08-07
> 17:52:32 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/kishorebatta-ossqcom/linux-firmware.git qdsp_firmwa=
re

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/641

josh

>
> for you to fetch changes up to df21d427c17adf0ff372490e14841b970539d056:
>
>    qcom: Add QDSP firmware file for Qualcomm QDU100 device. (2025-08-08
> 13:27:29 +0530)
>
> ----------------------------------------------------------------
> Kishore Batta (1):
>        qcom: Add QDSP firmware file for Qualcomm QDU100 device.
>
>   WHENCE                     |   1 +
>   qcom/qdu100/qdsp6sw.mbn.xz | Bin 0 -> 5589248 bytes
>   2 files changed, 1 insertion(+)
>   create mode 100644 qcom/qdu100/qdsp6sw.mbn.xz
>
