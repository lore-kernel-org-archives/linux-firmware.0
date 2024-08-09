Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01766C52D7C
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Aug 2024 11:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CCD3EC4AF0F; Fri,  9 Aug 2024 11:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7065C4AF0E
	for <linux-firmware@kernel.org>; Fri,  9 Aug 2024 11:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723203454;
	bh=ZwAcWLlU39muzWePM6HOVRO/Qw8ENw3rT+P5dMEP3NQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=G/SXGhnsnudnIGz8Sq5OaNmqnwGQPQjI2sfLgN61ChWGzZ+FaIZkVeqJVjL1qwac+
	 6jxJXKLSxq1TIroDJmuGVGvUuucrHciiD1tT/5UvTyYWMwNLJCoZrL6C7RtBsAsfar
	 X3vjggQBhUldmvX+N/haeUKBN3ec1k+UsYDen195Ew24Whd/i84G4FD8aZn0A8P+AC
	 GYvrSi16POVdqBKykqYsujMGTwIDLNdw1iTJwb6Z8ZP13c6cD0Q2fbYTDDafbconfK
	 WSzYx6jol7N0QKgCkl7OQCDh94arL85U7eaEyFcfMAi74b+64JPOif3kBMhgP6gpx4
	 m1Qq9qtU/Ua9g==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-64b417e1511so17584517b3.3
        for <linux-firmware@kernel.org>; Fri, 09 Aug 2024 04:37:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUEyUIMxtR2ar5PyDL4f0Y3f5YL3kmYVRk5wtgVH3brAezTkD790KeSLmNMe4c2T0AySIjl7Oc7lUsxUbOodWdP3rQHr7nRRim
X-Gm-Message-State: AOJu0Yze952seevQ7/gdJ0kGjDyRURji73zIh3dY4nCKmpCt8t8zcjDx
	JVGaHxIiUzhaEhuRcW+RBud8c9z1gSk0vwyyx6scu6l7eop/M2MBwo35e7qJxKxWAerAbW/3kje
	826mR7ThYoHPIHP84CUzP/k7jYxg=
X-Google-Smtp-Source: AGHT+IHEbamcs/tRkZqt3Cmeiv0ZLwfiAoio7QyjgkkLLUiHuE5Gs2StIqcf9FRGE6Z4TiDl/7zpxyF2gofXOTVi4pY=
X-Received: by 2002:a05:690c:2b02:b0:615:8c1:d7ec with SMTP id
 00721157ae682-69ec89aeec8mr12676747b3.33.1723203453925; Fri, 09 Aug 2024
 04:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <1723188568-20342-1-git-send-email-quic_dikshita@quicinc.com>
 <7A614880-F6AA-435F-9504-B9731773DF58@linaro.org> <08dc4b92-5f98-8408-1111-fc3bccb03ae8@quicinc.com>
 <B7612BB8-A086-42DE-810E-09F6B5A544FB@linaro.org>
In-Reply-To: <B7612BB8-A086-42DE-810E-09F6B5A544FB@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 9 Aug 2024 07:37:22 -0400
X-Gmail-Original-Message-ID: <CA+5PVA75z3ZD4rhabo=tF3sa6YpoKoP7DQqGcTR4p2YQOJj63g@mail.gmail.com>
Message-ID: <CA+5PVA75z3ZD4rhabo=tF3sa6YpoKoP7DQqGcTR4p2YQOJj63g@mail.gmail.com>
Subject: Re: [PATCH v2] qcom: update path for video firmware for vpu-1/2/3.0
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org, 
	quic_vgarodia@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 6:20=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On August 9, 2024 4:51:39 PM GMT+07:00, Dikshita Agarwal <quic_dikshita@q=
uicinc.com> wrote:
> >
> >
> >On 8/9/2024 1:48 PM, Dmitry Baryshkov wrote:
> >> On August 9, 2024 2:29:28 PM GMT+07:00, Dikshita Agarwal <quic_dikshit=
a@quicinc.com> wrote:
> >>> - Rename qcom/vpu-3.0/ to qcom/vpu/ to have common sub-folder for
> >>>  new firmware files.
> >>> - Move firmware files from vpu-1.0/ and vpu-2.0/ to vpu/ with
> >>>  proper names for firmware binaries and provide backwards-compatible
> >>>  links.
> >>>
> >>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >>> ---
> >>> Changes since v1:
> >>> - Updated firmware binary names to better names following
> >>>   common convention.
> >>> - Used Link: tag in WHENCE to create symlinks.
> >>>
> >>> WHENCE                                          |  10 ++++++----
> >>> qcom/{vpu-2.0/venus.mbn =3D> vpu/vpu20_p1.mbn}    | Bin
> >>> qcom/{vpu-1.0/venus.mbn =3D> vpu/vpu20_p4.mbn}    | Bin
> >>> qcom/{vpu-3.0/vpu30_4v.mbn =3D> vpu/vpu30_p4.mbn} | Bin
> >>> 4 files changed, 6 insertions(+), 4 deletions(-)
> >>> rename qcom/{vpu-2.0/venus.mbn =3D> vpu/vpu20_p1.mbn} (100%)
> >>> rename qcom/{vpu-1.0/venus.mbn =3D> vpu/vpu20_p4.mbn} (100%)
> >>> rename qcom/{vpu-3.0/vpu30_4v.mbn =3D> vpu/vpu30_p4.mbn} (100%)
> >>>
> >>> diff --git a/WHENCE b/WHENCE
> >>> index 0a737b6..edee7a9 100644
> >>> --- a/WHENCE
> >>> +++ b/WHENCE
> >>> @@ -5961,12 +5961,13 @@ File: qcom/venus-6.0/venus.mbn
> >>>
> >>> Version: VIDEO.VE.6.0-00049-PROD-1
> >>>
> >>> -File: qcom/vpu-1.0/venus.mbn
> >>> -Link: qcom/vpu-1.0/venus.mdt -> venus.mbn
> >>> +File: qcom/vpu/vpu20_p4.mbn
> >>> +Link: qcom/vpu-1.0/venus.mbn -> ../vpu/vpu20_p4.mbn
> >>>
> >>> Version: VIDEO.VPU.1.0-00087-PROD-1
> >>>
> >>> -File: qcom/vpu-2.0/venus.mbn
> >>> +File: qcom/vpu/vpu20_p1.mbn
> >>> +Link: qcom/vpu-2.0/venus.mbn -> ../vpu/vpu20_p1.mbn
> >>>
> >>> Version: VIDEO.VPU.2.0-00049-PROD-1
> >>>
> >>> @@ -5979,7 +5980,8 @@ https://developer.qualcomm.com/hardware/dragonb=
oard-410c/tools
> >>>
> >>> Driver: iris - Qualcomm Iris video codec accelerator
> >>>
> >>> -File: qcom/vpu-3.0/vpu30_4v.mbn
> >>> +File: qcom/vpu/vpu30_p4.mbn
> >>> +Link: qcom/vpu-3.0/vpu30_4v.mbn -> ../vpu/vpu30_p4.mbn
> >>
> >> Since there was no linux-firmware release with qcom/vpu-3.0 subdir, ca=
n we drop this extra symlink? I don't think there is a need to be compatibl=
e with the interim git revisions.
> >>
> >> Other than that LGTM, thank you!
> >
> >Sure, will remove the link for vpu-3.0 in next revision.
>
> Thanks!
>
> Josh, could we please get v3 (hoping Dikshita posts it soon) into the nex=
t release (I guess it is due in a couple if days), so that we won't have to=
 bother everybody with yet another compatibility symlink?

OK.  Plan to do a release later today, and I'll make sure to include v3.

josh
