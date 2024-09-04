Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71498CD4853
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Sep 2024 17:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3EF78C4CEC5; Wed,  4 Sep 2024 17:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F7AC4CEC6
	for <linux-firmware@kernel.org>; Wed,  4 Sep 2024 17:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725470194;
	bh=PZ9MkqJhXFEwODsxI0D9F0GCpFwtRVtNO9yCCzvafxM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=c8qmi700DhAkRPcw/35ExJRVhec9Nqt9roS20fVwNJv6dvNIOOfre5kAjTyeRuUEI
	 qjzZANuxmVho1Hx6pJ7PKK0EupmCh0BF4wK5RApOm8cRVdm5z/xskKfpjeldCILsaJ
	 OPJAJlfp77PoWmoePxFZr+YT2xkROVedJl8C6AhD/+V97DxRkRfgy3BGPEbGoyRZuN
	 J0e4hDXPBoLUGk2hm+t8Ss0I46GNLaif71Z+t+/1Rtt4O1RmRYzZpo+ilh+QnBtZB1
	 q9Dmi3DOX9StgXRPQA8UskPqZ3gB76klvV+kbrISpTi5dGON12nUnHJ3PiC6RmwvJH
	 ZudUYXfnZ008g==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6daf46ee332so21669537b3.0
        for <linux-firmware@kernel.org>; Wed, 04 Sep 2024 10:16:34 -0700 (PDT)
X-Gm-Message-State: AOJu0YzlpdX5RlzbMquFXWx8STjtrHxDazitGuVXf2ZcloNBplcFFfTx
	ifq7AHGA+pCpDbVp/XJbQy4HGmoXEcHnwy8JU7Hc4MndvKmZAWMnB6u99EbKHGmPgIcQaNu1WIN
	AbvC3+Nl5LWX49xH9yvKWYq29A8U=
X-Google-Smtp-Source: AGHT+IFH87TmxFPqXKmwOdY/TT/uChAaGpSGxnRxyrR6ADKo3eDaEdTYc5PlJZWLRQSeF2+5ga3wiBfjL8628oYd0bE=
X-Received: by 2002:a05:690c:b:b0:6c3:7d68:b400 with SMTP id
 00721157ae682-6d40f3411f1mr193209807b3.10.1725470193336; Wed, 04 Sep 2024
 10:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <007501dafee6$abe2ed80$03a8c880$@opensource.cirrus.com>
In-Reply-To: <007501dafee6$abe2ed80$03a8c880$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 4 Sep 2024 13:16:21 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7AbN9cTqDsnPMx3iA9=uwPZW_jARY+PXqZhJ2EG2eg4g@mail.gmail.com>
Message-ID: <CA+5PVA7AbN9cTqDsnPMx3iA9=uwPZW_jARY+PXqZhJ2EG2eg4g@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] cirrus: cs35l56: Add firmware for Cirrus
 CS35L54 for some HP laptops
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 12:22=E2=80=AFPM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> We=E2=80=99d like to add the firmware for the Cirrus CS35L54 smart amplif=
iers on a couple of HP laptops (these are supported by the cs35l56 driver i=
nfrastructure)
>
>
>
> Thanks,
>
> -Simon
>
>
>
> The following changes since commit 7a7a88fe1a481c6a1d04b1733a446c11e4f169=
35:
>
>
>
>   Merge branch 'amd-staging' into 'main' (2024-09-03 16:49:10 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ 2024-09-04

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/290

josh

>
>
>
> for you to fetch changes up to a9c9dbf495fd3aa6e880b2ba32af576f83e7f7fa:
>
>
>
>   cirrus: cs35l56: Add firmware for Cirrus CS35L54 for some HP laptops (2=
024-09-04 16:05:13 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (1):
>
>       cirrus: cs35l56: Add firmware for Cirrus CS35L54 for some HP laptop=
s
>
>
>
> WHENCE                                        |  13 ++++++++++++-
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp1.bin | Bin 0 -> 7500 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp2.bin | Bin 0 -> 7464 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp3.bin | Bin 0 -> 7468 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp4.bin | Bin 0 -> 7500 bytes
>
> cirrus/cs35l56/CS35L56_Rev3.11.18.wmfw        | Bin 0 -> 33308 bytes
>
> 6 files changed, 12 insertions(+), 1 deletion(-)
>
> create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp1.bin
>
> create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp2.bin
>
> create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp3.bin
>
> create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp4.bin
>
> create mode 100644 cirrus/cs35l56/CS35L56_Rev3.11.18.wmfw
