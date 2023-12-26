Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B3EC46CD3
	for <linux-firmware@archiver.kernel.org>; Tue, 26 Dec 2023 19:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8ED6C433C8; Tue, 26 Dec 2023 19:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3224C433C9
	for <linux-firmware@kernel.org>; Tue, 26 Dec 2023 19:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703619591;
	bh=tEUkdJoGHYUCXZUO2ITEL3DugrdNCX/Uz4CE5oPFnLM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MAjuBLVlHAGKyFUBN2Vb69E6TkKVgzsB+Nrjqh+BMS8CTK542ceWv4O5q+jt/Hx7J
	 v6nGg5LS3vxDzARUg0QK0Hb01S3KiJXTbiBEkfm47VuZFPMaLAQW06mstcNrlXMve3
	 5xXyQzT1GZpiq0O2ElT5oQJ7SfwRV39RrKmRx0JQQVUpybi2mW9VkvCgUZrbHzQgfI
	 KtMlTN5oSOV5oEYQ7eb/1dCznkTKyOUN4sIpq7bnMBnCZH/+vy4+RvD8V4MVNf5vzH
	 +A58OptUgOhvzlxd8LTq+RlA9V4d5QiyYeTQ4Ou+KYczo9muznDjA2JFlm1JOYcZHW
	 vxsi+1Rmr0FRw==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5e7c1012a42so37014707b3.3
        for <linux-firmware@kernel.org>; Tue, 26 Dec 2023 11:39:51 -0800 (PST)
X-Gm-Message-State: AOJu0YxQkvgWKtnDpcoV23OpcUDQ9lQspJwYzzZEsDjwKA+UG6VUUbkL
	HMVxYUKYJQJDG9xUUT0GqOUB9xGjqeKfKZiwUT0=
X-Google-Smtp-Source: AGHT+IF02mANOpNt5pcffa92hjzStqH+Ebb74NweJ2FneL2x3DTh5r8gnKV73SfM/HvlwVck4YpM1yY57zy6akBryAo=
X-Received: by 2002:a81:8a85:0:b0:5d7:1941:357e with SMTP id
 a127-20020a818a85000000b005d71941357emr5025129ywg.101.1703619590810; Tue, 26
 Dec 2023 11:39:50 -0800 (PST)
MIME-Version: 1.0
References: <32b7fab2-ef5d-4ae3-8d81-c1143419d36f@opensource.cirrus.com>
In-Reply-To: <32b7fab2-ef5d-4ae3-8d81-c1143419d36f@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 26 Dec 2023 14:39:39 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7XA=hjvBQEijB346PV7qAstpZCP=BaWJLsp8h6HYWQAg@mail.gmail.com>
Message-ID: <CA+5PVA7XA=hjvBQEijB346PV7qAstpZCP=BaWJLsp8h6HYWQAg@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp
 CS35L41 for ASUS Zenbook 2022/2023 laptops
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 11:53=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp
> CS35L41 for ASUS Zenbook 2022/2023 laptops.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit c156e6be6d4a0a2290e7059bc74fb0612aa196=
93:
>
>    Merge branch 'robot/pr-0-1702625169' into 'main' (2023-12-15 12:16:57
> +0000)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware/ for-upstream

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/100

josh

>
> for you to fetch changes up to 4471d9c47a3d05bbea9a369ae8c63bdd95bb773e:
>
>    cirrus: Add CS35L41 firmware and tunings for ASUS Zenbook 2023 Models
> (2023-12-18 16:44:19 +0000)
>
> ----------------------------------------------------------------
> Stefan Binding (2):
>        cirrus: Add CS35L41 firmware and tunings for ASUS Zenbook 2022 Mod=
els
>        cirrus: Add CS35L41 firmware and tunings for ASUS Zenbook 2023 Mod=
els
>
>   WHENCE                                              |  72
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid0-l0.bin | Bin 0 -> 1936 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid0-r0.bin | Bin 0 -> 1936 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid1-l0.bin | Bin 0 -> 1944 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid1-r0.bin | Bin 0 -> 1944 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid0-l0.bin | Bin 0 -> 2024 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid0-r0.bin | Bin 0 -> 2024 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid1-l0.bin | Bin 0 -> 2024 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid1-r0.bin | Bin 0 -> 2024 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431863-spkid0-l0.bin | Bin 0 -> 1964 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431863-spkid0-r0.bin | Bin 0 -> 1968 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431863-spkid1-l0.bin | Bin 0 -> 1964 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431863-spkid1-r0.bin | Bin 0 -> 1968 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid0-l0.bin | Bin 0 -> 1928 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid0-r0.bin | Bin 0 -> 1928 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid1-l0.bin | Bin 0 -> 1928 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid1-r0.bin | Bin 0 -> 1928 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid0-l0.bin | Bin 0 -> 2024 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid0-r0.bin | Bin 0 -> 2020 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid1-l0.bin | Bin 0 -> 2024 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid1-r0.bin | Bin 0 -> 2020 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431ee2-l0.bin        | Bin 0 -> 1944 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431ee2-r0.bin        | Bin 0 -> 1948 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431f1f-l0.bin        | Bin 0 -> 1984 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431f1f-r0.bin        | Bin 0 -> 1984 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid0-l0.bin | Bin 0 -> 1924 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid0-r0.bin | Bin 0 -> 1924 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid1-l0.bin | Bin 0 -> 1924 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid1-r0.bin | Bin 0 -> 1924 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-104316d3-spkid0-l0.bin | Bin 0 -> 4728 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-104316d3-spkid0-r0.bin | Bin 0 -> 4728 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-104316d3-spkid1-l0.bin | Bin 0 -> 4736 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-104316d3-spkid1-r0.bin | Bin 0 -> 4736 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-104316f3-spkid0-l0.bin | Bin 0 -> 5492 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-104316f3-spkid0-r0.bin | Bin 0 -> 5204 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-104316f3-spkid1-l0.bin | Bin 0 -> 5492 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-104316f3-spkid1-r0.bin | Bin 0 -> 5204 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431863-spkid0-l0.bin | Bin 0 -> 4756 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431863-spkid0-r0.bin | Bin 0 -> 4760 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431863-spkid1-l0.bin | Bin 0 -> 4756 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431863-spkid1-r0.bin | Bin 0 -> 4760 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-104318d3-spkid0-l0.bin | Bin 0 -> 4720 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-104318d3-spkid0-r0.bin | Bin 0 -> 4720 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-104318d3-spkid1-l0.bin | Bin 0 -> 4720 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-104318d3-spkid1-r0.bin | Bin 0 -> 4720 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431da2-spkid0-l0.bin | Bin 0 -> 5024 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431da2-spkid0-r0.bin | Bin 0 -> 5020 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431da2-spkid1-l0.bin | Bin 0 -> 5024 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431da2-spkid1-r0.bin | Bin 0 -> 5020 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431ee2-l0.bin        | Bin 0 -> 4920 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431ee2-r0.bin        | Bin 0 -> 4924 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431f1f-l0.bin        | Bin 0 -> 4860 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431f1f-r0.bin        | Bin 0 -> 4860 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431f62-spkid0-l0.bin | Bin 0 -> 5284 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431f62-spkid0-r0.bin | Bin 0 -> 4996 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431f62-spkid1-l0.bin | Bin 0 -> 5284 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431f62-spkid1-r0.bin | Bin 0 -> 4996 byt=
es
>   57 files changed, 72 insertions(+)
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid0-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid0-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid1-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316d3-spkid1-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid0-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid0-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid1-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104316f3-spkid1-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431863-spkid0-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431863-spkid0-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431863-spkid1-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431863-spkid1-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid0-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid0-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid1-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-104318d3-spkid1-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid0-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid0-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid1-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431da2-spkid1-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431ee2-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431ee2-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f1f-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f1f-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid0-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid0-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid1-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431f62-spkid1-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104316d3-spkid0-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104316d3-spkid0-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104316d3-spkid1-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104316d3-spkid1-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104316f3-spkid0-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104316f3-spkid0-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104316f3-spkid1-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104316f3-spkid1-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431863-spkid0-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431863-spkid0-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431863-spkid1-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431863-spkid1-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104318d3-spkid0-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104318d3-spkid0-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104318d3-spkid1-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-104318d3-spkid1-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431da2-spkid0-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431da2-spkid0-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431da2-spkid1-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431da2-spkid1-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431ee2-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431ee2-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431f1f-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431f1f-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431f62-spkid0-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431f62-spkid0-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431f62-spkid1-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431f62-spkid1-r0.bin
>
