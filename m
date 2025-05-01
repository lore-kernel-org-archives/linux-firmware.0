Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41982C369DC
	for <linux-firmware@archiver.kernel.org>; Thu,  1 May 2025 14:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1C08C4CEEF; Thu,  1 May 2025 14:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC248C4CEED
	for <linux-firmware@kernel.org>; Thu,  1 May 2025 14:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746108336;
	bh=qo7T6wIaTLNIDmWMRzcQfAa226EBHsRrC/o7SZKI/x0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=eOTceziHLvZH+T+U9FvHQN15+q7c+YCTnzeYeXBIjd7fzYUTwJ9v5yNZULuGWQNA9
	 LMfx+MZHyY8+ap5I0W2ubZky6VyxPJlTObCnVi7+XnnY9Fbw68QcSWC1MLcGvwK3ab
	 6oVGLIZnnh4+quOeeIDRbc+pMRQW5WgNvIlbwE5EQmbP2VZvs4WdBzdcXU8qI5+V4U
	 fUrIGA34yQP4FeProhQEMAvx+XAy5bV3dHhaU2+KTyDDzid57BwA6i1ikPuqJs/ro8
	 DpfHBjQ6CilhgKwo56kxjMiWnRkCJLt0AWfxIGxWB2qaaHDKeNRlreHMmBYHAV7Rlc
	 uV9vCJ/jKBfZg==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-708b3cc144cso9492877b3.2
        for <linux-firmware@kernel.org>; Thu, 01 May 2025 07:05:36 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzfb7O7YkEtp3OqSPoTOtPzpnnwhn2GAnYq2RX/7TqGrhginKIq
	gWGPqvmwbQNCa3dlrBQyute8aWfyYqngrawDBGPtk+3wNpq4iBxEjm523ottpRS3xsSmfDXL7P/
	72h/oKi/r3HC2DXbt0h3oOgZvlnM=
X-Google-Smtp-Source: AGHT+IF1Zi4YysU9XRkpkScYztYfvBOcmQ+hz7c0NmAtUc0pBy/rTwus1H87YAj8gjYg4xaI0uPSyzzRhO5Aj5mhAEc=
X-Received: by 2002:a05:690c:6a81:b0:6fb:b2a1:3157 with SMTP id
 00721157ae682-708bbdea6e1mr37478647b3.3.1746108336071; Thu, 01 May 2025
 07:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <000801dbba88$aff46670$0fdd3350$@opensource.cirrus.com>
In-Reply-To: <000801dbba88$aff46670$0fdd3350$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 1 May 2025 10:05:24 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5mvevROLMVxaJFgQ_guy32-mZSkSf0OWpwwOXdSjokaQ@mail.gmail.com>
X-Gm-Features: ATxdqUGVb3DUg54cx0TuYBn9lQLh8TSIoypQdqyNSZhv826daK6Oj6mhca-K8WU
Message-ID: <CA+5PVA5mvevROLMVxaJFgQ_guy32-mZSkSf0OWpwwOXdSjokaQ@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Update firmware for Cirrus CS35L56 Amps
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 7:03=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> We=E2=80=99d like to update the firmware for the Cirrus CS35L56 smart amp=
lifier.
>
>
>
> There are four patches today adding and updating support for several
>
> products from Dell, Lenovo and ASUS.
>
> Thanks,
>
> -Simon
>
>
>
> The following changes since commit 4a0f825b83e9eb9439245503399ccbc0d7e275=
c2:
>
>
>
>   Merge branch 'mt7925' into 'main' (2025-04-30 13:17:57 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l56-20250501

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/534

josh

>
>
>
> for you to fetch changes up to cb876e3622a96cc805c624388e2c8a64195c1b5d:
>
>
>
>   cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops (=
2025-05-01 10:49:08 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (4):
>
>       cirrus: cs35l56: Update firmware for Cirrus Amps for some Dell lapt=
ops
>
>       cirrus: cs35l56: Update firmware for Cirrus Amps for some Lenovo la=
ptops
>
>       cirrus: cs35l56: Add firmware for Cirrus Amps for some ASUS laptops
>
>       cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo lapto=
ps
>
>
>
> WHENCE                                               |  46 ++++++++++++++=
+++++++++++++++++++++++---------
>
> cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp1.bin | Bin 11532 -> 11536=
 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp2.bin | Bin 11532 -> 11536=
 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp1.bin | Bin 11524 -> 11532=
 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp2.bin | Bin 11524 -> 11532=
 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0-amp1.bin | Bin 0 -> 8256 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0-amp2.bin | Bin 0 -> 8256 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1-amp1.bin | Bin 0 -> 8256 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1-amp2.bin | Bin 0 -> 8256 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampl.bin | Bin 6772 -> 6772 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampr.bin | Bin 6776 -> 6776 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampl.bin | Bin 6768 -> 6768 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampr.bin | Bin 6772 -> 6772 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp1.bin        | Bin 0 -> 8288 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp2.bin        | Bin 0 -> 8284 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp1.bin | Bin 8348 -> 0 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp2.bin | Bin 8348 -> 0 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp1.bin | Bin 0 -> 7216 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp2.bin | Bin 0 -> 7216 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp1.bin | Bin 6200 -> 0 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp2.bin | Bin 6200 -> 0 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp1.bin | Bin 6212 -> 0 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp2.bin | Bin 6212 -> 0 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin | Bin 0 -> 7220 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin | Bin 0 -> 7220 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp1.bin | Bin 0 -> 8384 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp2.bin | Bin 0 -> 8368 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp1.bin | Bin 0 -> 8368 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp2.bin | Bin 0 -> 8368 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp1.bin        | Bin 0 -> 9448 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp2.bin        | Bin 0 -> 9448 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp3.bin        | Bin 0 -> 9448 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp4.bin        | Bin 0 -> 9448 byte=
s
>
> 33 files changed, 37 insertions(+), 9 deletions(-)
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp2.bin
>
> delete mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp1.bin
>
> delete mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp2.bin
>
> delete mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp1.bin
>
> delete mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp2.bin
>
> delete mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp1.bin
>
> delete mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp4.bin
