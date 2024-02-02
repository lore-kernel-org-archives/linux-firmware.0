Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B661C47DB3
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Feb 2024 12:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7AC1C43394; Fri,  2 Feb 2024 12:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D252CC433C7
	for <linux-firmware@kernel.org>; Fri,  2 Feb 2024 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706876691;
	bh=aJ8/I5K7jx2IODtkMtBnxGJQZMUsqH9LARD6z7YJ7XY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=GYpXgQQNwTKK3PVEm4PNBoy73bS9nV2/yNPNczgI/Bb68qyYdZ501v3FTXpzpxvmK
	 +hfoYErYp1vgygXtTM9BLLrcSswOYc0nnlK84nFD+ES6e34Fd7Z9jgrLVU5vGuHioU
	 PeHYiBzWxRJVtNgpmfRJhIW7L3dgOBRAtqcbczFuCEHX23r8yv+zX+nMIViukT/hH+
	 U0MKorOln3LYUYIM8mlpozxCqjOFTiXowaj6/T3IIyyFwnMqyDQboyFlkqrDvGY4QD
	 /LONWD+OlYx0MsEpaeBIxcAudaEYd0823Ps+y9SB3id2ianTv3HeHZBC9I55veXcq8
	 wj9scWXfL28IQ==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-603c5d7997aso19405137b3.1
        for <linux-firmware@kernel.org>; Fri, 02 Feb 2024 04:24:51 -0800 (PST)
X-Gm-Message-State: AOJu0Yy3iwmkNGVdQ3dkMF7B5f8WTOtm3gAmHfOxFWZmokkrkKjRjiJa
	IX2btY713iDzDVnq6hdJBSoIjrM1RIWAUQxk5vk8b/dmD/SKndU+XvoaNAo2hXOzHieG9RKweTv
	uKgUb+4gDrabz499OsEvKnD3P1ME=
X-Google-Smtp-Source: AGHT+IFUbUlfA/pz3igwsDIgzsZRnSGK06caXdquSWSS/uyekpgfQwhv4FUy7Gg4dVCLITg6MQRSWD9sOb76J/qJQwY=
X-Received: by 2002:a05:6902:4eb:b0:dbe:7c4c:3307 with SMTP id
 w11-20020a05690204eb00b00dbe7c4c3307mr2156680ybs.17.1706876690826; Fri, 02
 Feb 2024 04:24:50 -0800 (PST)
MIME-Version: 1.0
References: <9ea61a5b-17c1-4c7c-8560-cbd9fe7678f4@opensource.cirrus.com>
In-Reply-To: <9ea61a5b-17c1-4c7c-8560-cbd9fe7678f4@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 2 Feb 2024 07:24:40 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6N2+cDuf-=FjNS78jABaQnoRPnq1-LzpD+feNUn5woJg@mail.gmail.com>
Message-ID: <CA+5PVA6N2+cDuf-=FjNS78jABaQnoRPnq1-LzpD+feNUn5woJg@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp
 CS35L41 for HP Laptops
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/133

josh

On Fri, Jan 26, 2024 at 6:35=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp
> CS35L41 for various HP Consumer laptops.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit 0c40df810685c15141413cee5bea7233e1db43=
fb:
>
>    Merge branch 'consistent-file-spacing' into 'main' (2024-01-24
> 16:42:17 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware/ hp_fw_nodsd
>
> for you to fetch changes up to 9f4771365348f41a7cfae9469d47fffc1869aa10:
>
>    linux-firmware: Add firmware for Cirrus CS35L41 on HP Consumer
> Laptops (2024-01-26 11:11:42 +0000)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>        linux-firmware: Add firmware for Cirrus CS35L41 on HP Consumer
> Laptops
>
>   WHENCE                                                  | 416
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++-
>   cirrus/cs35l41-dsp1-spk-cali-103c89e7-l0.bin            | Bin 0 ->
> 1880 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c89e7-r0.bin            | Bin 0 ->
> 1880 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid0-l0.bin     | Bin 0 ->
> 1896 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid0-r0.bin     | Bin 0 ->
> 1900 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid1-l0.bin     | Bin 0 ->
> 1900 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid1-r0.bin     | Bin 0 ->
> 1900 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid0-l0.bin     | Bin 0 ->
> 1776 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid0-r0.bin     | Bin 0 ->
> 1776 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid1-l0.bin     | Bin 0 ->
> 1780 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid1-r0.bin     | Bin 0 ->
> 1780 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid0-l0.bin     | Bin 0 ->
> 1796 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid0-r0.bin     | Bin 0 ->
> 1796 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid1-l0.bin     | Bin 0 ->
> 1800 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid1-r0.bin     | Bin 0 ->
> 1800 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid0-l0.bin     | Bin 0 ->
> 1788 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid0-r0.bin     | Bin 0 ->
> 1788 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid1-l0.bin     | Bin 0 ->
> 1792 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid1-r0.bin     | Bin 0 ->
> 1792 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a6e-l0.bin            | Bin 0 ->
> 1888 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a6e-l1.bin            | Bin 0 ->
> 1892 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a6e-r0.bin            | Bin 0 ->
> 1892 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8a6e-r1.bin            | Bin 0 ->
> 1888 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid0-l0.bin     | Bin 0 ->
> 1916 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid0-r0.bin     | Bin 0 ->
> 1916 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid1-l0.bin     | Bin 0 ->
> 1904 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid1-r0.bin     | Bin 0 ->
> 1908 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid0-l0.bin     | Bin 0 ->
> 1892 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid0-r0.bin     | Bin 0 ->
> 1892 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid1-l0.bin     | Bin 0 ->
> 1892 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid1-r0.bin     | Bin 0 ->
> 1892 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid0-l0.bin     | Bin 0 ->
> 1864 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid0-r0.bin     | Bin 0 ->
> 1864 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid1-l0.bin     | Bin 0 ->
> 1864 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid1-r0.bin     | Bin 0 ->
> 1864 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid0-l0.bin     | Bin 0 ->
> 1940 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid0-r0.bin     | Bin 0 ->
> 1940 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid1-l0.bin     | Bin 0 ->
> 1940 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid1-r0.bin     | Bin 0 ->
> 1940 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid0-l0.bin     | Bin 0 ->
> 1936 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid0-r0.bin     | Bin 0 ->
> 1936 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid1-l0.bin     | Bin 0 ->
> 1932 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid1-r0.bin     | Bin 0 ->
> 1932 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid0-l0.bin     | Bin 0 ->
> 1928 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid0-r0.bin     | Bin 0 ->
> 1928 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid1-l0.bin     | Bin 0 ->
> 1924 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid1-r0.bin     | Bin 0 ->
> 1924 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid0-l0.bin     | Bin 0 ->
> 1920 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid0-r0.bin     | Bin 0 ->
> 1916 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid1-l0.bin     | Bin 0 ->
> 1916 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid1-r0.bin     | Bin 0 ->
> 1916 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8cdd-spkid0.bin        | Bin 0 ->
> 1892 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8cde-spkid0.bin        | Bin 0 ->
> 1892 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8cde-spkid1.bin        | Bin 0 ->
> 1892 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8d01-l0.bin            | Bin 0 ->
> 1888 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8d01-l1.bin            | Bin 0 ->
> 1888 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c89e7-l0.bin            | Bin 0 ->
> 5328 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c89e7-r0.bin            | Bin 0 ->
> 5328 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a28-spkid0-l0.bin     | Bin 0 ->
> 4672 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a28-spkid0-r0.bin     | Bin 0 ->
> 4672 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a28-spkid1-l0.bin     | Bin 0 ->
> 4672 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a28-spkid1-r0.bin     | Bin 0 ->
> 4672 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a29-spkid0-l0.bin     | Bin 0 ->
> 3936 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a29-spkid0-r0.bin     | Bin 0 ->
> 3936 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a29-spkid1-l0.bin     | Bin 0 ->
> 3940 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a29-spkid1-r0.bin     | Bin 0 ->
> 3940 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a2c-spkid0-l0.bin     | Bin 0 ->
> 3956 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a2c-spkid0-r0.bin     | Bin 0 ->
> 3956 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a2c-spkid1-l0.bin     | Bin 0 ->
> 3960 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a2c-spkid1-r0.bin     | Bin 0 ->
> 3960 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a2e-spkid0-l0.bin     | Bin 0 ->
> 3948 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a2e-spkid0-r0.bin     | Bin 0 ->
> 3948 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a2e-spkid1-l0.bin     | Bin 0 ->
> 3952 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a2e-spkid1-r0.bin     | Bin 0 ->
> 3952 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a6e-l0.bin            | Bin 0 ->
> 4312 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a6e-l1.bin            | Bin 0 ->
> 4268 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a6e-r0.bin            | Bin 0 ->
> 4316 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8a6e-r1.bin            | Bin 0 ->
> 4360 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8bb3-spkid0-l0.bin     | Bin 0 ->
> 4184 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8bb3-spkid0-r0.bin     | Bin 0 ->
> 4184 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8bb3-spkid1-l0.bin     | Bin 0 ->
> 4088 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8bb3-spkid1-r0.bin     | Bin 0 ->
> 4084 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8bdd-spkid0-l0.bin     | Bin 0 ->
> 4712 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8bdd-spkid0-r0.bin     | Bin 0 ->
> 4712 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8bdd-spkid1-l0.bin     | Bin 0 ->
> 4712 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8bdd-spkid1-r0.bin     | Bin 0 ->
> 4712 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8bdf-spkid0-l0.bin     | Bin 0 ->
> 4684 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8bdf-spkid0-r0.bin     | Bin 0 ->
> 4684 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8bdf-spkid1-l0.bin     | Bin 0 ->
> 4684 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8bdf-spkid1-r0.bin     | Bin 0 ->
> 4684 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c15-spkid0-l0.bin     | Bin 0 ->
> 4160 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c15-spkid0-r0.bin     | Bin 0 ->
> 4160 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c15-spkid1-l0.bin     | Bin 0 ->
> 4160 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c15-spkid1-r0.bin     | Bin 0 ->
> 4160 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c16-spkid0-l0.bin     | Bin 0 ->
> 4156 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c16-spkid0-r0.bin     | Bin 0 ->
> 4156 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c16-spkid1-l0.bin     | Bin 0 ->
> 4152 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c16-spkid1-r0.bin     | Bin 0 ->
> 4152 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c66-spkid0-l0.bin     | Bin 0 ->
> 4716 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c66-spkid0-r0.bin     | Bin 0 ->
> 4716 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c66-spkid1-l0.bin     | Bin 0 ->
> 4712 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c66-spkid1-r0.bin     | Bin 0 ->
> 4712 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c67-spkid0-l0.bin     | Bin 0 ->
> 4708 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c67-spkid0-r0.bin     | Bin 0 ->
> 4708 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c67-spkid1-l0.bin     | Bin 0 ->
> 4708 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c67-spkid1-r0.bin     | Bin 0 ->
> 4708 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8cdd-spkid0.bin        | Bin 0 ->
> 4056 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8cde-spkid0.bin        | Bin 0 ->
> 4060 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8cde-spkid1.bin        | Bin 0 ->
> 4056 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8d01-l0.bin            | Bin 0 ->
> 4052 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8d01-l1.bin            | Bin 0 ->
> 4052 bytes
>   cirrus/cs35l41/v6.56.0/halo_cspl_RAM_revB2_29.58.0.wmfw | Bin 0 ->
> 33664 bytes
>   cirrus/cs35l41/v6.68.0/halo_cspl_RAM_revB2_29.70.0.wmfw | Bin 0 ->
> 33868 bytes
>   113 files changed, 415 insertions(+), 1 deletion(-)
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89e7-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c89e7-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a28-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a29-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2c-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a2e-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a6e-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a6e-l1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a6e-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8a6e-r1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bb3-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdd-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8bdf-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c15-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c16-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c66-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c67-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cdd-spkid0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cde-spkid0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8cde-spkid1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8d01-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8d01-l1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c89e7-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c89e7-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a28-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a28-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a28-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a28-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a29-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a29-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a29-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a29-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a2c-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a2c-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a2c-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a2c-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a2e-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a2e-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a2e-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a2e-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a6e-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a6e-l1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a6e-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8a6e-r1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bb3-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bb3-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bb3-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bb3-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bdd-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bdd-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bdd-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bdd-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bdf-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bdf-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bdf-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8bdf-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c15-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c15-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c15-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c15-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c16-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c16-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c16-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c16-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c66-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c66-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c66-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c66-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c67-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c67-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c67-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c67-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cdd-spkid0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cde-spkid0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cde-spkid1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8d01-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8d01-l1.bin
>   create mode 100755 cirrus/cs35l41/v6.56.0/halo_cspl_RAM_revB2_29.58.0.w=
mfw
>   create mode 100755 cirrus/cs35l41/v6.68.0/halo_cspl_RAM_revB2_29.70.0.w=
mfw
>
