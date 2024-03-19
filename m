Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B893C54E71
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Mar 2024 19:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A070C433C7; Tue, 19 Mar 2024 19:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0329AC433F1
	for <linux-firmware@kernel.org>; Tue, 19 Mar 2024 19:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710875283;
	bh=FvH+wpwA2925Tws99mG2ihauatLLz84xSTodrVWSkhw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Zd9fgl6m0MM0ke+hBVtiTzHy+KO+5ZOgJAc3KI9Tkahq7yajFMsxk5Tp9AOwLmxbo
	 KzMedYuhXc7bO0rGEEUyJqZPFmkYK+6m4Muc/DY9EJRCE5V89GQ96DuyfSfF9HYc5+
	 YRpCXXkPJXY0jxWmXEoXB+G5VzlOKO69CQUJQKuIX9plixZyouaeejRunxGzRMeS3D
	 PKyHrfGxwjY7IfRCoNQAUYSYWACFZW19nMeWqdzBrRNOPFuMnuU1ftbclc1nkADJzh
	 sCTim4xY23pCy+0Rd6DRjBUj/qnZ5GRrRJ92MAG5yuCyM3++gwpcKKG78W/2y0VQ6q
	 R8nxkjx3TLmsA==
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dbed179f0faso139145276.1
        for <linux-firmware@kernel.org>; Tue, 19 Mar 2024 12:08:02 -0700 (PDT)
X-Gm-Message-State: AOJu0YwvXjPQPZM+fYyudFaBLVXy7NvSoR0i74AIdErZwMf9x8HxhkK+
	Xt4Av/6KiegEq1rpPg1WNBmrZhKA5U1xuCcgY+6VMS/LZ/y8UoarNx/I3W0eNOYuXk12py5E4nX
	OSdcHMlHx3HRuzBxrQt/K5o33oJI=
X-Google-Smtp-Source: AGHT+IE+jRSC78MwnlnoqvWBqtkI3iT/1s3/m8d2b0GR86UlXTMxpzN7Rbtr01k1y+TNiTBTkxGc7jjFTBE2RhW4thY=
X-Received: by 2002:a25:ef0f:0:b0:dd9:3ac0:5414 with SMTP id
 g15-20020a25ef0f000000b00dd93ac05414mr1941430ybd.7.1710875282123; Tue, 19 Mar
 2024 12:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <000c01da7a0e$eb0e6190$c12b24b0$@opensource.cirrus.com>
In-Reply-To: <000c01da7a0e$eb0e6190$c12b24b0$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 19 Mar 2024 15:07:51 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4Skibrn8etfwVZPpF2fcfABQtHA_2585u3q9HQRW7w7w@mail.gmail.com>
Message-ID: <CA+5PVA4Skibrn8etfwVZPpF2fcfABQtHA_2585u3q9HQRW7w7w@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add CS35L56 firmware for DELL XPS laptops
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 11:05=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp
>
> CS35L56 for Dell XPS laptops
>
>
>
> Thanks,
>
>  -Simon
>
>
>
> The following changes since commit 37d26b9bbd46c656f9f56badb460b4886ecabd=
c7:
>
>
>
>   Merge branch 'tsse_fw' into 'main' (2024-03-19 12:08:19 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l56

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/181

josh

>
>
>
> for you to fetch changes up to 57077702373e7ef40f0ca197724428d614bd92f8:
>
>
>
>   linux-firmware: Add firmware for Cirrus CS35L56 for Dell laptops (2024-=
03-19 15:00:16 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (1):
>
>       linux-firmware: Add firmware for Cirrus CS35L56 for Dell laptops
>
>
>
> WHENCE                                               |  44 ++++++++++++++=
++++++++++++++++++++++++++++++
>
> cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp1.bin | Bin 0 -> 11204 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp2.bin | Bin 0 -> 11192 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp3.bin | Bin 0 -> 11204 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp4.bin | Bin 0 -> 11192 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp1.bin | Bin 0 -> 11196 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp2.bin | Bin 0 -> 11184 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp3.bin | Bin 0 -> 11196 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp4.bin | Bin 0 -> 11184 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp1.bin | Bin 0 -> 11208 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp2.bin | Bin 0 -> 11192 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp3.bin | Bin 0 -> 11208 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp4.bin | Bin 0 -> 11192 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp1.bin | Bin 0 -> 11200 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp2.bin | Bin 0 -> 11184 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp3.bin | Bin 0 -> 11200 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp4.bin | Bin 0 -> 11184 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp1.bin | Bin 0 -> 11180 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp2.bin | Bin 0 -> 11180 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp3.bin | Bin 0 -> 11180 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp4.bin | Bin 0 -> 11180 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp1.bin | Bin 0 -> 11188 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp2.bin | Bin 0 -> 11184 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp3.bin | Bin 0 -> 11188 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp4.bin | Bin 0 -> 11184 byt=
es
>
> cirrus/cs35l56/CS35L56_Rev3.11.11.wmfw               | Bin 0 -> 30516 byt=
es
>
> 26 files changed, 44 insertions(+)
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp4.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp4.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp4.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp4.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp4.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp4.bin
>
> create mode 100644 cirrus/cs35l56/CS35L56_Rev3.11.11.wmfw
