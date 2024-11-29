Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5922D729FD
	for <linux-firmware@archiver.kernel.org>; Fri, 29 Nov 2024 20:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6F955C4CECF; Fri, 29 Nov 2024 20:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B8DC4CED2
	for <linux-firmware@kernel.org>; Fri, 29 Nov 2024 20:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732911875;
	bh=P2Ak9oXEOqmscP0PaqIKyH38icu2c8j3oe0NoQp5Sfw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=rIfQc6GoNRf3sHaMyNyfc4u/UnNJXvyzdxD4qpboURsxFz6U0N/mCsbHuwbofI5nM
	 S0kFkdUIDkqsLhZyLpJ0JpJHOLgMzXcX2D4b63eae/bMSE9MTmhsNwCDoAKg23N45g
	 Zo7gZHjna9VOOSH/K7BBZ0lU6BZOaMaM1by9irzP7VB82kk+Z7HM7kJ4zr2GSbXzcu
	 aFj6mQ5vC5mLZS4SOgijJ6QY+hzHRsmjf3AsishcBaMrtJ0u9hpwwlP3H8+UBxBtli
	 5dXQl15ZS/oAwAjm9aG6izAABJ4TelhZPxv9t9IWV9Mca6V5wldFO3glmxcjx/OVQD
	 hfKWKRiE8KhBw==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6eeb66727e7so22766297b3.2
        for <linux-firmware@kernel.org>; Fri, 29 Nov 2024 12:24:35 -0800 (PST)
X-Gm-Message-State: AOJu0Yy3UO5ntBSvvkwMDTt7AcXoFDWYhejwq+y8mYQbBSCildrcC27k
	SfmagixbknhyzEBNyikAz2V2ZBwP5wcduX8kjJT61TorYBsi7FWXSyb027DlMnrKbjlcYZBJwO7
	XKhJ4IutTev8miC8M3QbFBjEzm4c=
X-Google-Smtp-Source: AGHT+IFEt2jzrMTLdSysPFkAL32UOGkrinUJBZ1vMEBbFPCtCmyNsKb3MYPx3iuvBYkP8NVOwqZLAMWgirj/nJkSlPI=
X-Received: by 2002:a05:690c:2504:b0:6e8:497:49cc with SMTP id
 00721157ae682-6ef371d1386mr189109677b3.2.1732911874548; Fri, 29 Nov 2024
 12:24:34 -0800 (PST)
MIME-Version: 1.0
References: <000201db418f$6757d5e0$360781a0$@opensource.cirrus.com>
In-Reply-To: <000201db418f$6757d5e0$360781a0$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 29 Nov 2024 15:24:23 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7gB1NQkk68v8WFL7ew52mxipEWLPECRG3dfCiwkQSd4g@mail.gmail.com>
Message-ID: <CA+5PVA7gB1NQkk68v8WFL7ew52mxipEWLPECRG3dfCiwkQSd4g@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Amps for some
 Dell laptops
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/379

josh

On Thu, Nov 28, 2024 at 7:17=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> We=E2=80=99d like to add the firmware for the Cirrus CS35L56 smart amplif=
ier for some Dell Laptops.
>
> Thanks,
>
> -Simon
>
>
>
> The following changes since commit 7c3031c18ab851792c49f594a4d43200d55a79=
43:
>
>
>
>   Merge branch 'robot/pr-0-1732634796' into 'main' (2024-11-26 16:12:19 +=
0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l56-20241128
>
>
>
> for you to fetch changes up to 741a828989a0356de48401d2f88b5eaeed6948c7:
>
>
>
>   cirrus: cs35l56: Add firmware for Cirrus CS35L56 for various Dell lapto=
ps (2024-11-28 12:06:35 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (1):
>
>       cirrus: cs35l56: Add firmware for Cirrus CS35L56 for various Dell l=
aptops
>
>
>
> WHENCE                                               |  13 +++++++++++++
>
> cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp1.bin | Bin 0 -> 11532 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp2.bin | Bin 0 -> 11532 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp1.bin | Bin 0 -> 11532 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp2.bin | Bin 0 -> 11532 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp1.bin | Bin 0 -> 11532 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp2.bin | Bin 0 -> 11532 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp1.bin | Bin 0 -> 11532 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp2.bin | Bin 0 -> 11532 byt=
es
>
> cirrus/cs35l56/CS35L56_Rev3.11.27.wmfw               | Bin 0 -> 34964 byt=
es
>
> 10 files changed, 13 insertions(+)
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56/CS35L56_Rev3.11.27.wmfw
