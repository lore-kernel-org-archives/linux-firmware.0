Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7028C4345F
	for <linux-firmware@archiver.kernel.org>; Tue, 23 Apr 2024 14:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5B3EC32782; Tue, 23 Apr 2024 14:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87355C116B1
	for <linux-firmware@kernel.org>; Tue, 23 Apr 2024 14:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713882891;
	bh=j82YVQSu4KZQlZEEQb53c4ZF4eg3KwOpOi3haVU94/M=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=lrapilowIl/YouIq1Pav5XL2/mzMT9iNJ8Wyq83zqSiYVGxH7MN2kvdQyLY1aQLNL
	 8Y9kWdF1v4U6TPQbZVucC7ZH7YufO61H/ueknirNZil4F5hMYafb3af+FlnG4bf6f7
	 FMc1D1stcDxniEe9D8139n8FmBtvgS3TO4Oey2uP7X3jFEXAj00bHxmiNvuG5xUPQx
	 dMgSn2Mr1hmoGgQB/g0nHNai+uwLn/mD840zhEPYxCZTfmC708e8S5QyuPBAQmpdGE
	 vr0bRdXay9i30FlnCL6lH5KyvJXAwSGB+OrN2tcsZ4gFN+a/sL6mzgmzKEsMAKAHYe
	 BjJgozw7onF6w==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-de469a634fbso5828892276.2
        for <linux-firmware@kernel.org>; Tue, 23 Apr 2024 07:34:51 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxn0S4k5CFM/bQsMqT83q75rErp58XBrNq5h9spyfWfgFyqeoqg
	jwQa/kWpP/iHNvGgk5rZS/ssV2kepfJPnptxpONoHsTpiZoFyYhP1E6O6UUDWJLgYX+kZ9VeuKP
	veikeosQ3FP2U/HUl1dtKPu+Y4Xk=
X-Google-Smtp-Source: AGHT+IGsy8kWUMNMSUwuMUm+W1TNU62ANlJFBW8dSuCxDkblBJI2WqabBiJX5pQuCyhFRrtdKltS8B3Euk0I06mHsb0=
X-Received: by 2002:a25:2d0b:0:b0:dcf:313d:d4ab with SMTP id
 t11-20020a252d0b000000b00dcf313dd4abmr12217966ybt.54.1713882890473; Tue, 23
 Apr 2024 07:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <550e0024-f221-420a-bfe5-bd400603fa87@opensource.cirrus.com>
In-Reply-To: <550e0024-f221-420a-bfe5-bd400603fa87@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 23 Apr 2024 10:34:39 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6UzfEmQc9aS3onCxHEqFedPtG0VMW3BLrHXDT13qAArw@mail.gmail.com>
Message-ID: <CA+5PVA6UzfEmQc9aS3onCxHEqFedPtG0VMW3BLrHXDT13qAArw@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp
 CS35L41 for Lenovo Thinkbook 13X
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 9:37=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp
> CS35L41 for Lenovo Thinkbook 13X.
> Also removing various Calibration tuning files, which are no longer neede=
d.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit e6309bb28fa00cb785cdf0e9129471ebe236a2=
49:
>
>    Merge branch 'robot/patch-0-1713581904' into 'main' (2024-04-20
> 21:31:39 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware/ thinkbook13x

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/200

josh

>
> for you to fetch changes up to 8c856e1a07f3953cc2f92c69db922159a1db7ed4:
>
>    linux-firmware: Remove Calibration Firmware and Tuning for CS35L41
> (2024-04-23 13:43:19 +0100)
>
> ----------------------------------------------------------------
> Stefan Binding (2):
>        linux-firmware: Add firmware for Lenovo Thinkbook 13X
>        linux-firmware: Remove Calibration Firmware and Tuning for CS35L41
>
>   WHENCE                                              | 665
> ++-----------------------------------------------------------------------=
---------------------------------------------------------------------------=
--------------------------------
>   cirrus/cs35l41-dsp1-spk-cali-10280b27-spkid0.bin    | Bin 1920 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10280b27-spkid1.bin    | Bin 1920 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid0-l0.bin | Bin 1924 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid0-r0.bin | Bin 1924 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid1-l0.bin | Bin 1924 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid1-r0.bin | Bin 1924 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10280beb-l0.bin        | Bin 2232 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10280beb-r0.bin        | Bin 2232 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-l0.bin | Bin 1912 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-l1.bin | Bin 1908 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-r0.bin | Bin 1912 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-r1.bin | Bin 1908 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-l0.bin | Bin 1912 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-l1.bin | Bin 1912 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-r0.bin | Bin 1912 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-r1.bin | Bin 1912 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin    | Bin 1824 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin    | Bin 1824 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c896e-l0.bin        | Bin 1976 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c896e-r0.bin        | Bin 1976 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8971.bin           | Bin 1868 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8972.bin           | Bin 1868 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8973.bin           | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8975-l0.bin        | Bin 1920 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8975-r0.bin        | Bin 1920 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8981-l0.bin        | Bin 2012 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8981-l1.bin        | Bin 1968 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8981-r0.bin        | Bin 2012 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8981-r1.bin        | Bin 1968 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c89c3-r0.bin        | Bin 1972 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c89c3-r1.bin        | Bin 1960 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c89c6-l0.bin        | Bin 1776 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c89c6-r0.bin        | Bin 1776 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c89e7-l0.bin        | Bin 1880 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c89e7-r0.bin        | Bin 1880 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid0-l0.bin | Bin 1896 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid0-r0.bin | Bin 1900 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid1-l0.bin | Bin 1900 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid1-r0.bin | Bin 1900 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid0-l0.bin | Bin 1776 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid0-r0.bin | Bin 1776 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid1-l0.bin | Bin 1780 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid1-r0.bin | Bin 1780 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid0-l0.bin | Bin 1796 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid0-r0.bin | Bin 1796 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid1-l0.bin | Bin 1800 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid1-r0.bin | Bin 1800 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid0-l0.bin | Bin 1788 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid0-r0.bin | Bin 1788 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid1-l0.bin | Bin 1792 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid1-r0.bin | Bin 1792 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a6e-l0.bin        | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a6e-l1.bin        | Bin 1892 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a6e-r0.bin        | Bin 1892 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8a6e-r1.bin        | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b42.bin           | Bin 1868 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b43.bin           | Bin 1892 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b44.bin           | Bin 1884 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b45.bin           | Bin 1868 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b47.bin           | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b63-l0.bin        | Bin 1964 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b63-l1.bin        | Bin 1968 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b63-r0.bin        | Bin 1964 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b63-r1.bin        | Bin 1968 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r0.bin        | Bin 1952 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r1.bin        | Bin 1952 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b92.bin           | Bin 1856 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid0-l0.bin | Bin 1916 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid0-r0.bin | Bin 1916 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid1-l0.bin | Bin 1904 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid1-r0.bin | Bin 1908 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid0-l0.bin | Bin 1892 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid0-r0.bin | Bin 1892 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid1-l0.bin | Bin 1892 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid1-r0.bin | Bin 1892 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid0-l0.bin | Bin 1864 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid0-r0.bin | Bin 1864 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid1-l0.bin | Bin 1864 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid1-r0.bin | Bin 1864 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid0-l0.bin | Bin 1940 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid0-r0.bin | Bin 1940 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid1-l0.bin | Bin 1940 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid1-r0.bin | Bin 1940 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid0-l0.bin | Bin 1936 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid0-r0.bin | Bin 1936 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid1-l0.bin | Bin 1932 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid1-r0.bin | Bin 1932 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c46.bin           | Bin 1932 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c47.bin           | Bin 1940 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c48.bin           | Bin 1932 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c49.bin           | Bin 1932 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid0-l0.bin | Bin 1928 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid0-r0.bin | Bin 1928 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid1-l0.bin | Bin 1924 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid1-r0.bin | Bin 1924 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid0-l0.bin | Bin 1920 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid0-r0.bin | Bin 1916 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid1-l0.bin | Bin 1916 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid1-r0.bin | Bin 1916 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8ca4.bin           | Bin 1988 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8cdd-spkid0.bin    | Bin 1892 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8cde-spkid0.bin    | Bin 1892 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8cde-spkid1.bin    | Bin 1892 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8cf5-l0.bin        | Bin 2048 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8cf5-l1.bin        | Bin 2052 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8cf5-r0.bin        | Bin 2048 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8cf5-r1.bin        | Bin 2052 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-l0.bin | Bin 1976 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-r0.bin | Bin 1976 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-l0.bin | Bin 1976 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-r0.bin | Bin 1976 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-l0.bin | Bin 1876 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-r0.bin | Bin 1872 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-l0.bin | Bin 1876 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-r0.bin | Bin 1872 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-l0.bin | Bin 1876 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-r0.bin | Bin 1872 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-l0.bin | Bin 1876 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-r0.bin | Bin 1876 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431473-l0.bin        | Bin 1876 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431473-r0.bin        | Bin 1872 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431483-l0.bin        | Bin 1868 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431483-r0.bin        | Bin 1876 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-l0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-r0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-l0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-r0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-l0.bin | Bin 1904 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-r0.bin | Bin 1904 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-l0.bin | Bin 1908 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-r0.bin | Bin 1908 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-l0.bin | Bin 1876 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-r0.bin | Bin 1872 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-l0.bin | Bin 1872 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-r0.bin | Bin 1876 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-l0.bin | Bin 1900 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-r0.bin | Bin 1900 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-l0.bin | Bin 1900 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-r0.bin | Bin 1900 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid0-l0.bin | Bin 1936 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid0-r0.bin | Bin 1936 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid1-l0.bin | Bin 1944 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid1-r0.bin | Bin 1944 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid0-l0.bin | Bin 2024 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid0-r0.bin | Bin 2024 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid1-l0.bin | Bin 2024 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid1-r0.bin | Bin 2024 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-l0.bin | Bin 1876 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-r0.bin | Bin 1876 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-l0.bin | Bin 1876 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-r0.bin | Bin 1876 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431863-spkid0-l0.bin | Bin 1964 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431863-spkid0-r0.bin | Bin 1968 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431863-spkid1-l0.bin | Bin 1964 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431863-spkid1-r0.bin | Bin 1968 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid0-l0.bin | Bin 1928 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid0-r0.bin | Bin 1928 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid1-l0.bin | Bin 1928 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid1-r0.bin | Bin 1928 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid0-l0.bin | Bin 2044 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid0-r0.bin | Bin 2048 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid1-l0.bin | Bin 2048 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid1-r0.bin | Bin 2048 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-l0.bin | Bin 1968 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-r0.bin | Bin 1972 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-l0.bin | Bin 1968 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-r0.bin | Bin 1972 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-l0.bin | Bin 1876 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-r0.bin | Bin 1884 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-l0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-r0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid0-l0.bin | Bin 1936 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid0-r0.bin | Bin 1932 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid1-l0.bin | Bin 1936 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid1-r0.bin | Bin 1932 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid0-l0.bin | Bin 1936 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid0-r0.bin | Bin 1936 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid1-l0.bin | Bin 1944 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid1-r0.bin | Bin 1944 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid0-l0.bin | Bin 1944 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid0-r0.bin | Bin 1944 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid1-l0.bin | Bin 1944 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid1-r0.bin | Bin 1944 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-l0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-r0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-l0.bin | Bin 1876 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-r0.bin | Bin 1884 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-l0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-r0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-l0.bin | Bin 1884 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-r0.bin | Bin 1884 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-l0.bin | Bin 1876 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-r0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-l0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-r0.bin | Bin 1884 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-l0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-r0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-l0.bin | Bin 1884 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-r0.bin | Bin 1884 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid0-l0.bin | Bin 2024 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid0-r0.bin | Bin 2020 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid1-l0.bin | Bin 2024 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid1-r0.bin | Bin 2020 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-l0.bin | Bin 1996 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-r0.bin | Bin 1996 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-l0.bin | Bin 1996 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-r0.bin | Bin 1996 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-l0.bin | Bin 2012 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-r0.bin | Bin 2012 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-l0.bin | Bin 2012 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-r0.bin | Bin 2012 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431ee2-l0.bin        | Bin 1944 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431ee2-r0.bin        | Bin 1948 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid0-l0.bin | Bin 1956 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid0-r0.bin | Bin 1932 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid1-l0.bin | Bin 1940 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid1-r0.bin | Bin 1916 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431f1f-l0.bin        | Bin 1984 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431f1f-r0.bin        | Bin 1984 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid0-l0.bin | Bin 1924 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid0-r0.bin | Bin 1924 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid1-l0.bin | Bin 1924 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid1-r0.bin | Bin 1924 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-l0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-r0.bin | Bin 1884 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-l0.bin | Bin 1876 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-r0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-l0.bin | Bin 1884 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-r0.bin | Bin 1884 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-l0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-r0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-l0.bin | Bin 1884 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-r0.bin | Bin 1884 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-l0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-r0.bin | Bin 1888 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa22f1-l0.bin        | Bin 1564 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa22f1-r0.bin        | Bin 1564 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa22f2-l0.bin        | Bin 1556 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa22f2-r0.bin        | Bin 1556 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-l0.bin | Bin 1592 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-r0.bin | Bin 1592 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-l0.bin | Bin 1608 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-r0.bin | Bin 1608 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid0.bin    | Bin 1528 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid1.bin    | Bin 1520 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid0.bin    | Bin 1528 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid1.bin    | Bin 1520 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa386f.bin           | Bin 1580 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa3877.bin           | Bin 1536 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa3878.bin           | Bin 1540 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-l0.bin | Bin 1560 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-r0.bin | Bin 1560 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-l0.bin | Bin 1560 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-r0.bin | Bin 1556 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa38b4-spkid0-l0.bin | Bin 1536 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa38b4-spkid0-r0.bin | Bin 1536 -> 0 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa3865-l0.bin        | Bin 0 -> 5468 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa3865-r0.bin        | Bin 0 -> 5472 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa3866-l0.bin        | Bin 0 -> 5496 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa3866-r0.bin        | Bin 0 -> 5496 byt=
es
>   261 files changed, 6 insertions(+), 659 deletions(-)
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b27-spkid0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b27-spkid1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280b28-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280beb-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280beb-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-l1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid0-r1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-l1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280c4d-spkid1-r1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10280cbd-spkid1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c896e-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c896e-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8971.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8972.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8973.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8975-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8975-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8981-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8981-l1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8981-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8981-r1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89c3-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89c3-r1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89c6-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89c6-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89e7-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89e7-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a6e-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a6e-l1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a6e-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a6e-r1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b42.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b43.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b44.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b45.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b47.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-l1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-r1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b92.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c46.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c47.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c48.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c49.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8ca4.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cdd-spkid0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cde-spkid0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cde-spkid1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cf5-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cf5-l1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cf5-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cf5-r1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-104312af-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-104312af-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431473-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431473-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431483-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431483-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-r0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid0-l0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid0-r0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid1-l0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid1-r0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid0-l0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid0-r0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid1-l0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-r0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431863-spkid0-l0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431863-spkid0-r0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431863-spkid1-l0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431863-spkid1-r0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid0-l0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid0-r0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid1-l0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a63-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431a8f-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431b93-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c03-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c33-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c43-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-r0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid0-l0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid0-r0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid1-l0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e02-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-r0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431ee2-l0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431ee2-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid1-r0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f1f-l0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f1f-r0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid0-l0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid0-r0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid1-l0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a30-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a50-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-10433a60-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa22f1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa22f1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa22f2-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa22f2-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa3847-spkid1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa3855-spkid1.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa386f.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa3877.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa3878.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-l0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-r0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-l0.bin
>   delete mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-r0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa38b4-spkid0-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa38b4-spkid0-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa3865-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa3865-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa3866-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa3866-r0.bin
>
