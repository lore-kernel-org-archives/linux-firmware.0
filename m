Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E235BC19F2B
	for <linux-firmware@archiver.kernel.org>; Thu,  4 Aug 2022 11:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C765DC433C1; Thu,  4 Aug 2022 11:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05B9C433D6
	for <linux-firmware@kernel.org>; Thu,  4 Aug 2022 11:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659613513;
	bh=lqTFIIQ7gVv+57aC6obclUREC3aZPFpkHuwCKs6gpYA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ucr8oXfDzCbwlhrEYuNLBzLp1cbJhXOYJEWehXkWmE6EHMAelfKdCVHZ62O/BQ5Jt
	 mLmGlybaWigC7n06B4qfPWafPrK4dcpk9Ljfgy9EOLNjTpoxoUppz2kfRt2zvTTDkv
	 xIyBnRzarLJanpKognYR6xZmmLWiqOkTgf5FK6Rc0inMDN3LzT6qL2Z8htVkcTxal5
	 iMn9zT3z44U3jFAMERhAYeLEFMI2QLx0XLyb9L36TzVt5ROPBNLyV9hlcgLa/Lck6S
	 TxNRE2iTnK/bAzN/PxEIvgOifZG4DL75xwhAOGImk/w6ZmSY3fmKb6cRbBy72i+rUf
	 baHzyPqpIJ/2g==
Received: by mail-il1-f170.google.com with SMTP id g14so5190415ile.11
        for <linux-firmware@kernel.org>; Thu, 04 Aug 2022 04:45:13 -0700 (PDT)
X-Gm-Message-State: ACgBeo0mEGlCg8eYL5BILMi+SeV1FwccUSHkF5iVkn+x1F9cJispLJ22
	bcUH1XUtbH4SBMwIEVYkGXbrmckI3OdB6JYcrr4=
X-Google-Smtp-Source: AA6agR5VBfhQ54RjCvgIoV+SzeFr+LLbrc6NG+OBlYfoNIZLBYJFLUOJKzfmlFyDHe9zS3+AuSCJ85jmzkw6kKuOk0Y=
X-Received: by 2002:a05:6e02:1aa7:b0:2de:b9f1:593f with SMTP id
 l7-20020a056e021aa700b002deb9f1593fmr646457ilv.243.1659613512802; Thu, 04 Aug
 2022 04:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <00a301d8a750$8a20fe70$9e62fb50$@opensource.cirrus.com>
In-Reply-To: <00a301d8a750$8a20fe70$9e62fb50$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 4 Aug 2022 07:45:01 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4eTuySV5hdwQ1Bse-wo79eUGit-MkdZJwB5FL8jk1cFA@mail.gmail.com>
Message-ID: <CA+5PVA4eTuySV5hdwQ1Bse-wo79eUGit-MkdZJwB5FL8jk1cFA@mail.gmail.com>
Subject: Re: [PULL v3 linux-firmware] Add firmware for Cirrus CS35L41
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 3, 2022 at 11:49 AM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> Hi,
>
>
>
> We are adding firmware files to support Cirrus Logic smart amplifier
>
> CS35L41
>
>
>
> Please, let me know if there are any problems.
>
>
>
> Thanks,
>
>
>
> Stefan Binding
>
>
>
> changes since version 1:
>
>
>
> Corrected LICENSE.cirrus
>
>
>
> changes since version 2:
>
>
>
> Updated LICENSE.cirrus
>
>
>
>
>
> The following changes since commit 150864a4d73e8c448eb1e2c68e65f07635fe1a66:
>
>
>
>   amdgpu partially revert "amdgpu: update beige goby to release 22.20" (2022-07-25 14:16:04 -0400)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware.git for-upstream

Pulled and pushed out.  Thank you for being so responsive to the
initial concerns and for catching the error on the v2 pull request.

josh

> for you to fetch changes up to feda1996d56d501a287fb6aa09cc1d46490a211a:
>
>
>
>   linux-firmware: Add firmware for Cirrus CS35L41 (2022-08-03 16:14:51 +0100)
>
>
>
> ----------------------------------------------------------------
>
> Vitaly Rodionov (1):
>
>       linux-firmware: Add firmware for Cirrus CS35L41
>
>
>
> LICENSE.cirrus                    | 182 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>
> WHENCE                            |  17 ++++++++++++++++
>
> cirrus/cs35l41-dsp1-spk-prot.bin  | Bin 0 -> 948 bytes
>
> cirrus/cs35l41-dsp1-spk-prot.wmfw | Bin 0 -> 34056 bytes
>
> 4 files changed, 199 insertions(+)
>
> create mode 100644 LICENSE.cirrus
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot.wmfw
