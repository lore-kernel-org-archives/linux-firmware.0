Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EE4C83F14
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Aug 2023 11:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BDBCFC433CA; Tue, 29 Aug 2023 11:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F32C433C9
	for <linux-firmware@kernel.org>; Tue, 29 Aug 2023 11:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693308503;
	bh=uKXJS1k0qRMiBNiW53UgbKYfUkBae0q2FhH38oUdiXE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MZKPV4iNu7mMXJOMOExr8CKmXHMk08VO0m9h7RYWdzmf0Un27G5mMQI3bfWtShvQ6
	 HPeYrmWTz2JDhPQH4Uu08dIUCAG+6cSv1eFkCyTTh4o1Vym32c9OL2agQbi5opcrwx
	 ieAUhIgOElW6Cm2zHxkxUaPC8qPZ+yBkp5p7wQb4coI5U04hj47QkPZJRPFDc31k7A
	 /jHeOamoZlTBKqHfKEc29pEeJZZZ0FcNcMtJPCzkNcFN6YPu09wYIwxiUcOBYgvX/O
	 h6unzWo/EeEa5DL6uyJFhScnqXmeRg10mmWI4hKfzThe0AVsTMFT80tMDGbmo7V2wh
	 UI68N5BytcbdA==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-59254e181a2so48088187b3.1
        for <linux-firmware@kernel.org>; Tue, 29 Aug 2023 04:28:23 -0700 (PDT)
X-Gm-Message-State: AOJu0YzQGJ+LOwLUERvpmLeblEOrRkXXjJRQRE4GyPwxMEuvxQ1XnsI3
	CEUl+j4LggcFSXl65KtX6SRnq34JuZvI/7cYOuE=
X-Google-Smtp-Source: AGHT+IG15q73XQIiy8x/hJoW9TZBUNLRQfnXeW9qXbbx4GY5E2dvIbfIcDg4Oiu/9zBZpDvxT2a1Zmm59FOmsomlnC0=
X-Received: by 2002:a81:8483:0:b0:577:24d9:4001 with SMTP id
 u125-20020a818483000000b0057724d94001mr28139020ywf.13.1693308502754; Tue, 29
 Aug 2023 04:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230825202041.194349-1-hamza.mahfooz@amd.com>
 <CA+5PVA6vBbGK4DznO45gp3N3OEL8ERzyjUfe_fLGMCEZ2NjgYg@mail.gmail.com> <12e4c4eb-df91-4a7a-9072-ccfac8679c85@amd.com>
In-Reply-To: <12e4c4eb-df91-4a7a-9072-ccfac8679c85@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 29 Aug 2023 07:28:11 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7VNL1jMyW2fkz+kfKk7nA9g=xD0jKC37ndVebFaEWOcg@mail.gmail.com>
Message-ID: <CA+5PVA7VNL1jMyW2fkz+kfKk7nA9g=xD0jKC37ndVebFaEWOcg@mail.gmail.com>
Subject: Re: Update of amdgpu DMCUB firmware (2023-08-25)
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Wayne.Lin@amd.com, linux-firmware@kernel.org, alexander.deucher@amd.com, 
	mario.limonciello@amd.com, chandan.vurdigerenataraj@amd.com, 
	deepak.sharma@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 7:48=E2=80=AFAM Hamza Mahfooz <hamza.mahfooz@amd.co=
m> wrote:
>
> On 8/28/23 07:12, Josh Boyer wrote:
> > On Fri, Aug 25, 2023 at 4:20=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@am=
d.com> wrote:
> >>
> >> The following changes since commit a33f8f1abd1df344798188807de4b4397d7=
484d3:
> >>
> >>    amdgpu: update DMCUB to 0.0.181.0 for various AMDGPU ASICs (2023-08=
-25 15:25:00 -0400)
> >>
> >> are available in the Git repository at:
> >>
> >>    git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-08-25
> >
> > Does this replace Wayne Lin's pull request for tags/amd-2023-08-18?
>
> No, that is updating a different ASIC's fw. So, it's still needed.

Pulled and pushed out.

josh
