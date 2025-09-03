Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C99CA1009
	for <linux-firmware@archiver.kernel.org>; Wed,  3 Sep 2025 15:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA4F6C4CEF0; Wed,  3 Sep 2025 15:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C423BC4CEE7
	for <linux-firmware@kernel.org>; Wed,  3 Sep 2025 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756913134;
	bh=YCjzeJ1pP//rm5WPuboP4HqwyIqWSfRYosuQNrPqFSA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=CHSzCoKYlHSmEtZo6x4G81+HWTeEFu/W9M9qrJzFiDLgmre7L2ksQiCcuhyKuFE6d
	 KtdAt8sjYuvhshXBXPLb4FjcC6yyAVFyPnAfmJWtUIlByXHk/S/r/4zYFddig3Qrjz
	 quqA9iINJObOJzzrHK8sYmD+vIfC8ENUoWAadHllvUAFNB94tfZCxlhTOtbZGWqsK7
	 eg0KvpHaHcx89NF6au974dYybwgmko22QtDBglS3ET1Mk7lvucE9fDZ0j6h6ENnaCE
	 W8YOHOU8pJdDeaHlpmNi6f8RrUFrM4NAKoU9H7sO3TgMTat+XNNQzBh59exBK2Teey
	 fGluNr50MDVxg==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-72485e14efbso299447b3.3
        for <linux-firmware@kernel.org>; Wed, 03 Sep 2025 08:25:34 -0700 (PDT)
X-Gm-Message-State: AOJu0YyY47oIlKPcdCMWYdcnuGCK2rkBUvJ2qykt4Boh7sBGDdSpstTW
	gqii2lryYvbatW1xfNyP0Zy03g0Mv6/K/WhRGjINGRg1K52yjgfHp2Su4tT4loiaJX/lvb1NUu4
	Zp8t/EU/A8ZPtAY96R9yhgj+0ktMaXag=
X-Google-Smtp-Source: AGHT+IHsBwQr8phHmfAmQeNxDLtqY1ZN3oAGPpGTqjf1knQlSHofPxODNsXM1e2qtW9hS1m2UD5Hg3toOzjG99LbeTY=
X-Received: by 2002:a05:690c:690d:b0:722:72c4:c0b6 with SMTP id
 00721157ae682-722763e1652mr175141087b3.21.1756913134002; Wed, 03 Sep 2025
 08:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <d2e4501a-937f-413d-a58a-1a461c7947c2@oss.qualcomm.com>
 <cefhytvrazclwp3qicixaf3wh2p4vffhakt62of4cqua7rj7ok@r7gdz3nhgo2p>
 <27ae02e3-bb40-4bcd-a74a-eb228833add0@oss.qualcomm.com> <pnhpmwpdnhkexejum5zriq62wj7y46ot4elrlvcvwpmmfvk4mq@lskjszqjyedx>
 <CA+5PVA4=8c+_ocTJbzQ_vZCNUseZbjRoaqs0GZonVYt4KWPTWQ@mail.gmail.com> <15ad368e-0d36-41c7-a9be-71d08ba1efe2@oss.qualcomm.com>
In-Reply-To: <15ad368e-0d36-41c7-a9be-71d08ba1efe2@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 3 Sep 2025 11:25:22 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4o11_BisRiNYZhMoWR7Hyyrg7Qu6ZrxJLxraFoz2NThA@mail.gmail.com>
X-Gm-Features: Ac12FXw8eVxFYlyQeNxJ6feqJU4j3DJtI1YrTIYCkeqvWFhgDeVEfV4lWl3EYv0
Message-ID: <CA+5PVA4o11_BisRiNYZhMoWR7Hyyrg7Qu6ZrxJLxraFoz2NThA@mail.gmail.com>
Subject: Re: qcom: Update GPU firmwares of QCS615 chipset -v2
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 6:26=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> On 7/16/2025 5:01 AM, Josh Boyer wrote:
> > Pulled and pushed out.
> >
> > https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/613
> >
> > josh
> >
> > On Tue, Jul 15, 2025 at 8:16=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Tue, Jul 15, 2025 at 11:58:08AM +0530, Akhil P Oommen wrote:
> >>> On 7/15/2025 3:54 AM, Dmitry Baryshkov wrote:
> >>>> On Mon, Jul 14, 2025 at 10:55:03PM +0530, Akhil P Oommen wrote:
> >>>>> Hi,
> >>>>>
> >>>>> Add/update the gpu firmwares required for Qualcomm's QCS615 chipset=
.
> >>>>>
> >>>>> -Akhil
> >>>>>
> >>>>> ---
> >>>>> The following changes since commit 99d64b4f788c16e81b6550ef94f43c6b=
91cfad2d:
> >>>>>
> >>>>>   Merge branch 'amd-ucode' into kfw (2025-07-08 12:00:49 -0400)
> >>>>>
> >>>>> are available in the Git repository at:
> >>>>>
> >>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gp=
u-fw-QCS615v3
> >>>>>
> >>>>> for you to fetch changes up to 6907a7a381dd13d7fadc3a480ad470151c3f=
3782:
> >>>>>
> >>>>>   qcom: Update gpu firmwares of QCS615 chipset (2025-07-14 22:47:07=
 +0530)
> >>>>>
> >>>>> ----------------------------------------------------------------
> >>>>> Akhil P Oommen (1):
> >>>>>       qcom: Update gpu firmwares of QCS615 chipset
> >>>>>
> >>>>>  WHENCE                   |   3 +++
> >>>>>  qcom/a612_rgmu.bin       | Bin 0 -> 3072 bytes
> >>>>>  qcom/qcs615/a612_zap.mbn | Bin 14256 -> 14256 bytes
>
> Hi Josh,
>
> The latest tip of 'main' branch doesn't show this file. File size
> is 3KB instead of the expected 14KB. Any chance you might have
> accidentally pulled in a wrong PR?

Perhaps.  I suggest sending a new PR with whatever fixes are required.

josh

>
> FYI, there was an older PR which we decided to drop:
> https://lore.kernel.org/linux-firmware/d052562a-008a-4b80-b1ac-7340624bd5=
96@oss.qualcomm.com/
>
> -Akhil.
>
> >>>>
> >>>> This also sets several additional flags (OEM_ID, OEM_ID_INDEPENDENT,
> >>>> etc). Could you please confirm that the new file is actually necessa=
ry
> >>>> and that it will work with existing SM6150 devices?
> >>>
> >>> This firmware file is for the not-yet-commercialized QCS615 chipset
> >>> which has a newer non-hlos which uses a new security profile. SM6150 =
is
> >>> around 8 years old by now. And it is not supported in upstream yet, s=
o
> >>> no user afaik.
> >>>
> >>> In case the sm6150 gains upstream support, a zap firmware that works =
for
> >>> it should be available at qcom/sm6150 directory. I think the current
> >>> firmware with v1 profile may work, but can't be completely sure unles=
s
> >>> someone test it on sm6150. Not-a-lawyer, but in that case, I think
> >>> anybody can copy it from the git history of linux-firmware to qcom/sm=
6150.
> >>
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
