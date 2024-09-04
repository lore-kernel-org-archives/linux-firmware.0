Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1564CA0ED3
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Sep 2024 11:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3325C4CEC8; Wed,  4 Sep 2024 11:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C272C4CEC2;
	Wed,  4 Sep 2024 11:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725449799;
	bh=FoLPoft+GRS8n9A11OjJE0eOep/vZj65CupPPDpFpiU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=m73oVm8URDb0nZd3dW0XfPxYX9k1qrqKeKpM6n3UpxiwP+OPW1rIJ4X6TzCpbM+8i
	 B9iwBlNXiaF+k6EbTD2HEmYhwSoCPgehZ+afiup+Mu0cATddSE8Ivq3p5FtgsQgmY6
	 l/QCqPHas1NYO3TKmEdtjxEJAAIHgL0mk+plPI1jY44ywgEtFmLEkdahy1SEXfBtO7
	 q/DMGAzGDw0efDdh+UMHldnO53aV3IqDcjwi2w2s9enQDEQJhHqC+apwjdeZe/9/lJ
	 TGpOMfguP1jT2ubu3XQqBrVtmJmfF1w3SmXxaPY/tNu6ejSy8p6BQLnO+/HgXhlU3v
	 bwP/nbICefJ+Q==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6cdae28014dso5089417b3.1;
        Wed, 04 Sep 2024 04:36:39 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx7t7q+p4sREyYpMq6/zCx45Bacl7HWbnbVWsEnxYjOuNIN9BY1
	GY7pE7uuYMQIMpGW9DQ2hILVVqOubWsaBUjaQR+TDH6NpFyzJXc74qYXGiDeZaVQgV9a3dG5Smm
	G52xGPuJ8TpdaceSolhBbQ/bXKxM=
X-Google-Smtp-Source: AGHT+IGa80dVFtGwcCuQRga5SWtLwlx+2rU5TVlh6ubP70v9HjZ1z3ckUBjzULnKOpPQM8fccxM3n1be3OEMuWKuB0s=
X-Received: by 2002:a05:690c:dc7:b0:6c7:a120:e104 with SMTP id
 00721157ae682-6db25f554demr14602137b3.4.1725449798780; Wed, 04 Sep 2024
 04:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <9b5a5238-0e08-41e5-9cc0-346b446e0562@kernel.org>
In-Reply-To: <9b5a5238-0e08-41e5-9cc0-346b446e0562@kernel.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 4 Sep 2024 07:36:27 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4epRwKqZmhX6deEBC35Ks9D1toRpLQgu1m=W5+hET1LA@mail.gmail.com>
Message-ID: <CA+5PVA4epRwKqZmhX6deEBC35Ks9D1toRpLQgu1m=W5+hET1LA@mail.gmail.com>
Subject: Re: brcmfmac434*6 firmwares inclusion
To: Jiri Slaby <jirislaby@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 1:27=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> wr=
ote:
>
> Hi,
>
> would it be possible to incorporate these broadcom firmwares:
>    https://github.com/bsdkurt/brcm-supplemental
> into linux-firmware.git?
>
> The license appears to be the same as:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.g=
it/tree/LICENCE.broadcom_bcm43xx

The license being similar is not enough.  There's nothing that would
indicate the bsdkurt repo obtained those firmware files from Broadcom
in a manner that intended for them to be redistributed.

We'd need a submission from someone at Broadcom with a signed-off-by.

josh

>
> It would fix:
> https://bugzilla.suse.com/show_bug.cgi?id=3D1201112
>
> thanks,
> --
> js
> suse labs
