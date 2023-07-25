Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11685C0015E
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Jul 2023 10:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D07C6C433C9; Tue, 25 Jul 2023 10:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B512FC433C7
	for <linux-firmware@kernel.org>; Tue, 25 Jul 2023 10:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690282308;
	bh=YaFhFa38QUqk3jM1gmuMZA2JdBIiipSrcqhS1RraDa4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=uZBuEbL1L41UCJ/pVcvhKcABF/RdPSMS6HyRXKzm8By/xEQ468xc1WO83UQwd8oXr
	 0pXLSwqcqr3M/MlMG26x88Lw9iC+MWPzedWTRpWlSvYIlVZF41LlL4JV6dxYphDj1C
	 dRUqkfXLKu+PK1gOmRM97IuEI2/hgjMH/6HhZ2GQiuJYWOlmMU12No9sA4vVhQ9+6Z
	 vTOTI5ZaHb249rhvhBNnd8DtV6992Fc7xFJoEe9BzxtjMEN+NMgAQRaz97r31+ZIUH
	 k63yIpj7Kzc76NQCKAzkccZfkz9uxOj9fsfidZh67miGg6hrgEJ+YPMEkxeM4Q6qZy
	 qHVh6eyd6ejSA==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-58439daf39fso1394497b3.1
        for <linux-firmware@kernel.org>; Tue, 25 Jul 2023 03:51:48 -0700 (PDT)
X-Gm-Message-State: ABy/qLbxTEfDTKJHN7nfdXn0TTgBgc23krYM89xGKr0K6H8/KqTeWpki
	ok0sSbm4pjPSRwVtGoDdyjbu7T7X/hKEPVb64W8=
X-Google-Smtp-Source: APBJJlFUBwz0/1LqY4En88nDKEMCN4U0aGMowjzJMB5pJhLxnV2h/8jjQ1P1p2eXSI+00bo2gr50wdzsMJIKuAR2fqs=
X-Received: by 2002:a25:2fcb:0:b0:d0e:b419:f4dc with SMTP id
 v194-20020a252fcb000000b00d0eb419f4dcmr5480921ybv.10.1690282307692; Tue, 25
 Jul 2023 03:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230715114046.1301714-1-pbrobinson@gmail.com> <20230715114046.1301714-2-pbrobinson@gmail.com>
In-Reply-To: <20230715114046.1301714-2-pbrobinson@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 25 Jul 2023 06:51:36 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5ZYbc0c9qqgJmPdTs8EwRY=JNeNXWP6iPBvY4Zrw0KsA@mail.gmail.com>
Message-ID: <CA+5PVA5ZYbc0c9qqgJmPdTs8EwRY=JNeNXWP6iPBvY4Zrw0KsA@mail.gmail.com>
Subject: Re: [PATCH 2/2] qcom: sc8280xp: LENOVO: remove directory sym link
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Both applied and pushed out.

josh

On Sat, Jul 15, 2023 at 7:40=E2=80=AFAM Peter Robinson <pbrobinson@gmail.co=
m> wrote:
>
> The firmware was only ever referenced in the 6.0 kernel by
> two firmware, for less than a month, by the 6.1 LTS kernel
> those references had been updated to the new location.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  WHENCE | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/WHENCE b/WHENCE
> index e53002fb..c3de0234 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5640,7 +5640,6 @@ File: qcom/sc8280xp/LENOVO/21BX/cdspr.jsn
>  File: qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
>  File: qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
>  File: qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
> -Link: qcom/LENOVO/21BX -> ../sc8280xp/LENOVO/21BX
>
>  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for detai=
ls
>
> --
> 2.41.0
>
