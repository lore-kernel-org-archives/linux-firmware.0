Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C86CC433FE
	for <linux-firmware@archiver.kernel.org>; Wed, 30 Nov 2022 12:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 147FBC433D6; Wed, 30 Nov 2022 12:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB93C433D7
	for <linux-firmware@kernel.org>; Wed, 30 Nov 2022 12:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669812874;
	bh=c++/qhBp4sU/rCKcdQnEdIHlLqphWgPlUzKG8D1SDJw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=eGyllB50j0WujmCu4q2682CA6CJCuxebwVO2z1au90NsrhwvCgRkAP31jWP8+MjNa
	 1ja3Qdz2oGVRytB8bgl/UJCZbIECLjSEdZONwMSVxaZb1LIsBPFp+W3BdJsvHXSCQD
	 1hPPTFF7qKx4rIsXYy+AyqJxd+w6j7YUVfxfzvUdeDWZfpHeCufh96UTJxYFE2w+NG
	 j8WM97KTYKAdfeeuEn51qbOEb+qEX8Cw14evOCcxFJM8JUdeOD4MvVWgPmMY2vbVNa
	 mFalsXf7EkxhVBwff/3EVxJaEsoQ/zIeh69U0A/SZd1yhCCrVgwUQDAvxCUUZ9lU+Z
	 6Chi2qlMmi4oA==
Received: by mail-oi1-f175.google.com with SMTP id n205so18637316oib.1
        for <linux-firmware@kernel.org>; Wed, 30 Nov 2022 04:54:33 -0800 (PST)
X-Gm-Message-State: ANoB5plVFQlv1qJ69op5B8MkeOd33EG2+oZho0jS+bOs4wfnaGJ7Ti0l
	mdODfsOhxmFxzHvvmql5H0PP7QX4H5hRin3hxlQ=
X-Google-Smtp-Source: AA0mqf6oyyUnS2yUb8/cTwHt43oa0zFQfxzuaeSGHJfRtw/H6c9pBJMNbKOZW4bDvI3q7ugAn8FrLpR1GIc4LTS47oo=
X-Received: by 2002:a05:6808:642:b0:353:b8c5:4845 with SMTP id
 z2-20020a056808064200b00353b8c54845mr20124660oih.267.1669812873095; Wed, 30
 Nov 2022 04:54:33 -0800 (PST)
MIME-Version: 1.0
References: <90a2aec23a5744a696b0f29942ae2838@quicinc.com>
In-Reply-To: <90a2aec23a5744a696b0f29942ae2838@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 30 Nov 2022 07:54:22 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5jBczZAW1HXjUPWtkoc5CQJQKPcBODPr0OmzNkbfZu_w@mail.gmail.com>
Message-ID: <CA+5PVA5jBczZAW1HXjUPWtkoc5CQJQKPcBODPr0OmzNkbfZu_w@mail.gmail.com>
Subject: Re: btqca firmware 20221124
To: "Rocky Liao (QUIC)" <quic_rjliao@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 24, 2022 at 1:55 AM Rocky Liao (QUIC)
<quic_rjliao@quicinc.com> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if you have any problems.
>
> The following changes since commit
> cdf9499cf6706b73935a139bb5e76777a87674fe:
>
>    linux-firmware: update firmware for MT7916 (Wed Nov 23 19:07:43 2022 +0800)
>
> are available in the Git repository at:
>
>    https://github.com/quicrjliao/qcabtfw.git

Pulled and pushed out.

josh

>
> for you to fetch changes up to 32d8681d21f2eef052cadfdfafc47e02eed6c2b2:
> ----------------------------------------------------------------
> Rocky Liao (1):
>         QCA: Add Bluetooth firmware for WCN785x (Thu Nov 24 14:44:27 2022 +0800)
>
>
