Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6BFC0015E
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Jul 2023 12:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0CF5C433C8; Mon, 24 Jul 2023 12:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79B1C433C9
	for <linux-firmware@kernel.org>; Mon, 24 Jul 2023 12:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690201304;
	bh=HPgR5UJAlWjzz9BoWTd874NMy4StEV+oAp9L7eHcnKI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Mzt+A+KwAMjgjmDtDU7SalEQqPaS6oJ/htsZfVcFluPO4MTTNY5XG5F5kleATJcar
	 vcaTU09rLPU3mztWUnlmP+ovoT991Wloc9U20vIMAr3e5OKvX+9ZQgFJYyyo1P5JQi
	 ZGLYlqkvxb6xEmUPVmk7QNzpKXjqg8pFBFr1DryEYndrnaSg4A79o3AAXD9ozmTHzo
	 C0U91m7Lt/SoN8zLqyZDFzh9RLUuakf+9bf7bHrQ6p+Flv6Mm78yguvtAnfQ36IjTj
	 DSDHhvzrfTQJruq8SQhzzLP9YJIL13fwX9lc7NVKiDdXfr7Tav0xNfGQCj579S0Vya
	 l/wvPiJa3EdbQ==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-ca4a6e11f55so3518334276.1
        for <linux-firmware@kernel.org>; Mon, 24 Jul 2023 05:21:44 -0700 (PDT)
X-Gm-Message-State: ABy/qLahHt/OijENIdpYgHu/V6lRqu/7X4zXB9HexTnTO+f80QOjbsHf
	8WZAJatoWJ7BBnwp3ZDukdIHpMPnrKZFHgn44fs=
X-Google-Smtp-Source: APBJJlGL9YTR/Qc9bIZ/DccFKry+NXiZTJV+RXL4JuUIBz0x0pIJPUohjprQN7PE+nqdj1lO/rREsFeRWUNqt7zcNpk=
X-Received: by 2002:a25:50e:0:b0:d05:c50d:7aa2 with SMTP id
 14-20020a25050e000000b00d05c50d7aa2mr5540729ybf.57.1690201303609; Mon, 24 Jul
 2023 05:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <3955b414-261d-c42e-9609-ba7b2aea0949@opensource.cirrus.com>
In-Reply-To: <3955b414-261d-c42e-9609-ba7b2aea0949@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Jul 2023 08:21:32 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6Mr9gmdLDiSFpTBaxPReXN2xc5SKzk0WSPehCU5h5sxg@mail.gmail.com>
Message-ID: <CA+5PVA6Mr9gmdLDiSFpTBaxPReXN2xc5SKzk0WSPehCU5h5sxg@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp
 CS35L41 for ASUS ROG 2023 Laptops
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 9:05=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp
> CS35L41 for ASUS ROG 2023 Laptops.
>
> Thanks,
>
> Stefan Binding
>
>
> The following changes since commit ee91452dac5abfc4c5b9827cf55e701d8c0ca6=
78:
>
>    Makefile, copy-firmware: support xz/zstd compressed firmware
> (2023-06-25 12:18:57 -0400)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware for-upstream

Pulled and pushed out.

josh

>
> for you to fetch changes up to 1a76e8bb646c08784ad4504d2722ff19c07181fd:
>
>    cirrus: Add CS35L41 firmware for ASUS ROG 2023 Models (2023-07-13
> 13:56:15 +0100)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>        cirrus: Add CS35L41 firmware for ASUS ROG 2023 Models
>
>   WHENCE                                                  | 169
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++
>   cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-l0.bin     | Bin 0 ->
> 1876 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-r0.bin     | Bin 0 ->
> 1872 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-l0.bin     | Bin 0 ->
> 1876 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-r0.bin     | Bin 0 ->
> 1872 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-l0.bin     | Bin 0 ->
> 1876 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-r0.bin     | Bin 0 ->
> 1872 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-l0.bin     | Bin 0 ->
> 1876 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-r0.bin     | Bin 0 ->
> 1876 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431473-l0.bin            | Bin 0 ->
> 1876 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431473-r0.bin            | Bin 0 ->
> 1872 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431483-l0.bin            | Bin 0 ->
> 1868 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431483-r0.bin            | Bin 0 ->
> 1876 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-l0.bin     | Bin 0 ->
> 1888 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-r0.bin     | Bin 0 ->
> 1888 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-l0.bin     | Bin 0 ->
> 1888 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-r0.bin     | Bin 0 ->
> 1888 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-l0.bin     | Bin 0 ->
> 1904 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-r0.bin     | Bin 0 ->
> 1904 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-l0.bin     | Bin 0 ->
> 1908 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-r0.bin     | Bin 0 ->
> 1908 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-l0.bin     | Bin 0 ->
> 1876 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-r0.bin     | Bin 0 ->
> 1872 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-l0.bin     | Bin 0 ->
> 1872 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-r0.bin     | Bin 0 ->
> 1876 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-l0.bin     | Bin 0 ->
> 1900 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-r0.bin     | Bin 0 ->
> 1900 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-l0.bin     | Bin 0 ->
> 1900 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-r0.bin     | Bin 0 ->
> 1900 bytes
>   cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-l0.bin     | Bin 0 ->
> 1876 bytes
>   cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-r0.bin     | Bin 0 ->
> 1876 bytes
>   cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-l0.bin     | Bin 0 ->
> 1876 bytes
>   cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-r0.bin     | Bin 0 ->
> 1876 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-l0.bin     | Bin 0 ->
> 1888 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-r0.bin     | Bin 0 ->
> 1888 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-l0.bin     | Bin 0 ->
> 1876 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-r0.bin     | Bin 0 ->
> 1884 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-l0.bin     | Bin 0 ->
> 1888 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-r0.bin     | Bin 0 ->
> 1888 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-l0.bin     | Bin 0 ->
> 1884 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-r0.bin     | Bin 0 ->
> 1884 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-l0.bin     | Bin 0 ->
> 1876 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-r0.bin     | Bin 0 ->
> 1888 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-l0.bin     | Bin 0 ->
> 1888 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-r0.bin     | Bin 0 ->
> 1884 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-l0.bin     | Bin 0 ->
> 1888 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-r0.bin     | Bin 0 ->
> 1888 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-l0.bin     | Bin 0 ->
> 1884 bytes
>   cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-r0.bin     | Bin 0 ->
> 1884 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431433-spkid0-l0.bin     | Bin 0 ->
> 4648 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431433-spkid0-r0.bin     | Bin 0 ->
> 4644 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431433-spkid1-l0.bin     | Bin 0 ->
> 4648 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431433-spkid1-r0.bin     | Bin 0 ->
> 4644 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431463-spkid0-l0.bin     | Bin 0 ->
> 4648 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431463-spkid0-r0.bin     | Bin 0 ->
> 4648 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431463-spkid1-l0.bin     | Bin 0 ->
> 4648 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431463-spkid1-r0.bin     | Bin 0 ->
> 4648 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431473-l0.bin            | Bin 0 ->
> 4648 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431473-r0.bin            | Bin 0 ->
> 4648 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431483-l0.bin            | Bin 0 ->
> 4644 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431483-r0.bin            | Bin 0 ->
> 4648 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431493-spkid0-l0.bin     | Bin 0 ->
> 4660 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431493-spkid0-r0.bin     | Bin 0 ->
> 4660 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431493-spkid1-l0.bin     | Bin 0 ->
> 4660 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431493-spkid1-r0.bin     | Bin 0 ->
> 4660 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431503-spkid0-l0.bin     | Bin 0 ->
> 4680 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431503-spkid0-r0.bin     | Bin 0 ->
> 4676 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431503-spkid1-l0.bin     | Bin 0 ->
> 4680 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431503-spkid1-r0.bin     | Bin 0 ->
> 4676 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431533-spkid0-l0.bin     | Bin 0 ->
> 4648 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431533-spkid0-r0.bin     | Bin 0 ->
> 4648 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431533-spkid1-l0.bin     | Bin 0 ->
> 4644 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431533-spkid1-r0.bin     | Bin 0 ->
> 4648 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431573-spkid0-l0.bin     | Bin 0 ->
> 5072 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431573-spkid0-r0.bin     | Bin 0 ->
> 5072 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431573-spkid1-l0.bin     | Bin 0 ->
> 5072 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431573-spkid1-r0.bin     | Bin 0 ->
> 5072 bytes
>   cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid0-l0.bin     | Bin 0 ->
> 4648 bytes
>   cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid0-r0.bin     | Bin 0 ->
> 4648 bytes
>   cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid1-l0.bin     | Bin 0 ->
> 4648 bytes
>   cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid1-r0.bin     | Bin 0 ->
> 4648 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid0-l0.bin     | Bin 0 ->
> 4660 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid0-r0.bin     | Bin 0 ->
> 4656 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid1-l0.bin     | Bin 0 ->
> 4648 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid1-r0.bin     | Bin 0 ->
> 4660 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid0-l0.bin     | Bin 0 ->
> 4660 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid0-r0.bin     | Bin 0 ->
> 4660 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid1-l0.bin     | Bin 0 ->
> 4656 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid1-r0.bin     | Bin 0 ->
> 4660 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid0-l0.bin     | Bin 0 ->
> 4648 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid0-r0.bin     | Bin 0 ->
> 4660 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid1-l0.bin     | Bin 0 ->
> 4656 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid1-r0.bin     | Bin 0 ->
> 4660 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid0-l0.bin     | Bin 0 ->
> 4660 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid0-r0.bin     | Bin 0 ->
> 4660 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid1-l0.bin     | Bin 0 ->
> 4660 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid1-r0.bin     | Bin 0 ->
> 4656 bytes
>   cirrus/cs35l41/v6.78.0/halo_cspl_RAM_revB2_29.80.0.wmfw | Bin 0 ->
> 34100 bytes
>   98 files changed, 169 insertions(+)
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431433-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431433-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431463-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431463-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431473-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431473-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431483-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431483-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431493-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431493-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431503-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431503-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431533-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431533-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431573-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431573-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-104317f3-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431c9f-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431caf-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431ccf-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431cef-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431433-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431433-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431433-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431433-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431463-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431463-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431463-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431463-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431473-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431473-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431483-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431483-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431493-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431493-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431493-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431493-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431503-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431503-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431503-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431503-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431533-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431533-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431533-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431533-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431573-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431573-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431573-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431573-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104317f3-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431c9f-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431caf-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431ccf-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431cef-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41/v6.78.0/halo_cspl_RAM_revB2_29.80.0.w=
mfw
>
