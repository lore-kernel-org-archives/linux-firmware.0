Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85362C77B7A
	for <linux-firmware@archiver.kernel.org>; Tue, 30 May 2023 10:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55DC0C4339B; Tue, 30 May 2023 10:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F543C433EF
	for <linux-firmware@kernel.org>; Tue, 30 May 2023 10:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685444077;
	bh=RuZhD82+IRn2OG2JQBISaW75abXT0MCBxtVKN19ALSs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ElnkDM3OUVXwNHeRBy4zBaJYIztY8NZ6gHSkTLbLwGc8xkUtIt8icM25ni4Lio3nN
	 V1cFWLrCUpthGB6gt4V5IHiSQ2zIdxsC3hZKL6yGQeDXnA0mlJZzWFQBBiyMNyQGzG
	 FOrCAOqZrsAVsUEO7wdIr7qs3OCPxlCPTXYqezV/thJTawfzrJJEnXilrnnx8XIjk0
	 xZNYxTL54KSObkrZn0tb/MUBfxf/9O9MLe3PMW7FYkiqAUzCeDCTHxdEPTEskYmwVo
	 ahvhLSwzQTFWIXvBIIv5V/i3icafoIzmii+TduvwGR663dllRv4e4bDeeXlD1TKNqL
	 4iid5v0GsTwOw==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-568ba7abc11so13824427b3.3
        for <linux-firmware@kernel.org>; Tue, 30 May 2023 03:54:37 -0700 (PDT)
X-Gm-Message-State: AC+VfDzij18/SW7ulhxIzvb97BWluDjvRyl3WwFryGOehl0wiWrsGE4t
	wf6K/u+JWguJrUqWBar5uyeeFmgzKQCBWFUSm5k=
X-Google-Smtp-Source: ACHHUZ69whJjMHBl4m6rXYYH3pBTR1chAlndPzoxeAgVrQv0P/yydB2RsDj1JOa8tIRX+tfPqHMWVO2GedXokblWs5M=
X-Received: by 2002:a25:af11:0:b0:bad:89:88aa with SMTP id a17-20020a25af11000000b00bad008988aamr2186294ybh.39.1685444076194;
 Tue, 30 May 2023 03:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <d9869d7c-b613-87c9-f00c-f61b98b40c6d@opensource.cirrus.com>
In-Reply-To: <d9869d7c-b613-87c9-f00c-f61b98b40c6d@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 30 May 2023 06:54:25 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7xOE8Vx6L+iTfeH5N=8ofNapx3WroGOdvZ8_APOYopeg@mail.gmail.com>
Message-ID: <CA+5PVA7xOE8Vx6L+iTfeH5N=8ofNapx3WroGOdvZ8_APOYopeg@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for new Asus ROG Laptops
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 11:16=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> Hi,
>
> We would like to add firmware files to support Cirrus Logic Smart Amp
> CS35L41 on new Asus ROG laptops.
>
> The following changes since commit 1ba3519eab0fbc3cedf6b423ea0470461b902c=
1b:
>
>    Merge branch 'dev-queue' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/firmware (2023-05-23
> 13:07:29 -0400)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware.git for-upstream

Pulled and pushed out.  Thanks

josh

>
> for you to fetch changes up to 403e1ee7212de8de2db6f9db3776406a39e308cb:
>
>    cirrus: Add firmware for new Asus ROG Laptops (2023-05-26 14:30:39 +01=
00)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>        cirrus: Add firmware for new Asus ROG Laptops
>
>   WHENCE                                              |  60
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-l0.bin | Bin 0 -> 1876 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-r0.bin | Bin 0 -> 1884 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-l0.bin | Bin 0 -> 1888 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-r0.bin | Bin 0 -> 1888 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-l0.bin | Bin
>   cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-r0.bin | Bin
>   cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-l0.bin | Bin
>   cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-r0.bin | Bin
>   cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-l0.bin | Bin 0 -> 1888 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-r0.bin | Bin 0 -> 1884 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-l0.bin | Bin 0 -> 1876 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-r0.bin | Bin 0 -> 1888 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-l0.bin | Bin 0 -> 1884 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-r0.bin | Bin 0 -> 1884 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-l0.bin | Bin 0 -> 1888 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-r0.bin | Bin 0 -> 1888 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-l0.bin | Bin 0 -> 1884 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-r0.bin | Bin 0 -> 1884 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-l0.bin | Bin 0 -> 1888 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-r0.bin | Bin 0 -> 1888 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid0-l0.bin | Bin 0 -> 4648 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid0-r0.bin | Bin 0 -> 4660 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-l0.bin | Bin 0 -> 4660 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-r0.bin | Bin 0 -> 4656 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-l0.bin | Bin
>   cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-r0.bin | Bin
>   cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-l0.bin | Bin
>   cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-r0.bin | Bin
>   cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid0-l0.bin | Bin 0 -> 4656 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid0-r0.bin | Bin 0 -> 4660 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid1-l0.bin | Bin 0 -> 4648 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid1-r0.bin | Bin 0 -> 4660 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid0-l0.bin | Bin 0 -> 4660 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid0-r0.bin | Bin 0 -> 4656 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid1-l0.bin | Bin 0 -> 4660 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid1-r0.bin | Bin 0 -> 4660 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid0-l0.bin | Bin 0 -> 4656 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid0-r0.bin | Bin 0 -> 4660 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid1-l0.bin | Bin 0 -> 4660 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid1-r0.bin | Bin 0 -> 4660 byt=
es
>   41 files changed, 60 insertions(+)
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-r0.bin
>   mode change 100755 =3D> 100644
> cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-l0.bin
>   mode change 100755 =3D> 100644
> cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-r0.bin
>   mode change 100755 =3D> 100644
> cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-l0.bin
>   mode change 100755 =3D> 100644
> cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431b93-spkid1-r0.bin
>   mode change 100755 =3D> 100644
> cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-l0.bin
>   mode change 100755 =3D> 100644
> cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-r0.bin
>   mode change 100755 =3D> 100644
> cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-l0.bin
>   mode change 100755 =3D> 100644
> cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a30-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a50-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433a60-spkid1-r0.bin
>
