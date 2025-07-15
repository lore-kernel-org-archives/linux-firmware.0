Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72899C83F17
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Jul 2025 23:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 330D0C4CEF6; Tue, 15 Jul 2025 23:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D371C4CEF1
	for <linux-firmware@kernel.org>; Tue, 15 Jul 2025 23:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752622296;
	bh=oWsdm0kMC3+7b99nQCWSt9WtQXSrfJ66tE1GVTFG+T0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=QIkgXFK8PYbpOdx06zIk3Lz/1wim19MTXW8g6dbiOvPt5X30pqbMxArxnxiYaQfIx
	 N15j4762/QyG1SImmZTM/Lz0h+5egbg9h644HIkBB+zR8DnTGc5zpgYNMoYEH3J4uH
	 3HIn4CGMLM3nF7DIKEAh+qtMeDlmxjbRAEV4Sijx53S7Himr7owSDCUMw9pM4j9FPz
	 bhklFRF1FwlPCx03kDSpwWSf6EObJZuuSRVH3a/42zuDfi4A1dORCljoRfUbGFHwkn
	 snfsXPXk+dl20FIzuFpRrIcHQSecx8ZZvir78JlLFovmMk/l/tCN+uZy14DohAVv+H
	 KQfbKcxh0Nt9A==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7086dcab64bso57761017b3.1
        for <linux-firmware@kernel.org>; Tue, 15 Jul 2025 16:31:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsSymFD55fEn5Cs5xFM3Sa7rnsc/hiWOBNtMc5M0ppt3AXRZ79sy8cqEncN6sIOpBdpz6gQd04hssH/P94Xg==@kernel.org
X-Gm-Message-State: AOJu0YxqUbzoLnf3l3sMLoA9TYdbkYB/OCRp93AZWqwC738Gl+5fvUqw
	E5SRiAcjb9Znq3lRHVFxI21cNwq+JY1VIQrTHNmUnvpBN7ViitvdDuKUA8D0fA3qC24SRiyetli
	28PmsVetpB0QjGxAUMlP8PXgnhZeOt/4=
X-Google-Smtp-Source: AGHT+IGrfmUvh6885oXvl8lw+0iIikp9xsf+IBhzFRjcQwBnHQ6eTLyZdYtZDGw40eRqsO4CjpMIgvxQFNKg4i+7R00=
X-Received: by 2002:a05:690c:3684:b0:70e:142d:9c52 with SMTP id
 00721157ae682-7183733a83dmr7858497b3.22.1752622295297; Tue, 15 Jul 2025
 16:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <d2e4501a-937f-413d-a58a-1a461c7947c2@oss.qualcomm.com>
 <cefhytvrazclwp3qicixaf3wh2p4vffhakt62of4cqua7rj7ok@r7gdz3nhgo2p>
 <27ae02e3-bb40-4bcd-a74a-eb228833add0@oss.qualcomm.com> <pnhpmwpdnhkexejum5zriq62wj7y46ot4elrlvcvwpmmfvk4mq@lskjszqjyedx>
In-Reply-To: <pnhpmwpdnhkexejum5zriq62wj7y46ot4elrlvcvwpmmfvk4mq@lskjszqjyedx>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 15 Jul 2025 19:31:24 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4=8c+_ocTJbzQ_vZCNUseZbjRoaqs0GZonVYt4KWPTWQ@mail.gmail.com>
X-Gm-Features: Ac12FXyQbxbD7nq4w4BE-jeEChIKtEQL_I2EfsyeTKT1MIKOd4b-naDlOnN-IB4
Message-ID: <CA+5PVA4=8c+_ocTJbzQ_vZCNUseZbjRoaqs0GZonVYt4KWPTWQ@mail.gmail.com>
Subject: Re: qcom: Update GPU firmwares of QCS615 chipset -v2
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/613

josh

On Tue, Jul 15, 2025 at 8:16=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Jul 15, 2025 at 11:58:08AM +0530, Akhil P Oommen wrote:
> > On 7/15/2025 3:54 AM, Dmitry Baryshkov wrote:
> > > On Mon, Jul 14, 2025 at 10:55:03PM +0530, Akhil P Oommen wrote:
> > >> Hi,
> > >>
> > >> Add/update the gpu firmwares required for Qualcomm's QCS615 chipset.
> > >>
> > >> -Akhil
> > >>
> > >> ---
> > >> The following changes since commit 99d64b4f788c16e81b6550ef94f43c6b9=
1cfad2d:
> > >>
> > >>   Merge branch 'amd-ucode' into kfw (2025-07-08 12:00:49 -0400)
> > >>
> > >> are available in the Git repository at:
> > >>
> > >>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu=
-fw-QCS615v3
> > >>
> > >> for you to fetch changes up to 6907a7a381dd13d7fadc3a480ad470151c3f3=
782:
> > >>
> > >>   qcom: Update gpu firmwares of QCS615 chipset (2025-07-14 22:47:07 =
+0530)
> > >>
> > >> ----------------------------------------------------------------
> > >> Akhil P Oommen (1):
> > >>       qcom: Update gpu firmwares of QCS615 chipset
> > >>
> > >>  WHENCE                   |   3 +++
> > >>  qcom/a612_rgmu.bin       | Bin 0 -> 3072 bytes
> > >>  qcom/qcs615/a612_zap.mbn | Bin 14256 -> 14256 bytes
> > >
> > > This also sets several additional flags (OEM_ID, OEM_ID_INDEPENDENT,
> > > etc). Could you please confirm that the new file is actually necessar=
y
> > > and that it will work with existing SM6150 devices?
> >
> > This firmware file is for the not-yet-commercialized QCS615 chipset
> > which has a newer non-hlos which uses a new security profile. SM6150 is
> > around 8 years old by now. And it is not supported in upstream yet, so
> > no user afaik.
> >
> > In case the sm6150 gains upstream support, a zap firmware that works fo=
r
> > it should be available at qcom/sm6150 directory. I think the current
> > firmware with v1 profile may work, but can't be completely sure unless
> > someone test it on sm6150. Not-a-lawyer, but in that case, I think
> > anybody can copy it from the git history of linux-firmware to qcom/sm61=
50.
>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
>
> --
> With best wishes
> Dmitry
