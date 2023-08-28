Return-Path: <SRS0=vF/C=EN=redhat.com=btissoir@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F026C71153
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Aug 2023 14:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65184C433C7; Mon, 28 Aug 2023 14:41:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BAA85C433C8
	for <linux-firmware@kernel.org>; Mon, 28 Aug 2023 14:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BAA85C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693233667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WOrWpOjc7vcCncAg5xB2codynZVunegzbirU5flr7aQ=;
	b=LIQXRtggOc6/daiARaQ5l92m7bRSc8XhVuL/leHFj9KhmKtOcZkwaesvT2fUjbd9o8ysYp
	JNoYYjZL5D1DWvgzr/AKxCEPg6IvJVbei0EVs/LvZyHQdyFx23FdYq2L6phybHQGWAeMew
	jumBDRFAZYoxYBybBmdtadl6yVuT5oY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-WZmjVPaFMoS5TJIx7h-OkQ-1; Mon, 28 Aug 2023 10:41:04 -0400
X-MC-Unique: WZmjVPaFMoS5TJIx7h-OkQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-52a62955316so1005668a12.3
        for <linux-firmware@kernel.org>; Mon, 28 Aug 2023 07:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693233663; x=1693838463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOrWpOjc7vcCncAg5xB2codynZVunegzbirU5flr7aQ=;
        b=hpJ3sPgdVJwu8sNL2jtDVLHnV1rJMw9qPjxrq/JDOfx2b71013OTGKqOdkiV+j9iCf
         +RTg/Z+qlHsdijfqzPraKS4tOaJSpIOwLfLKV09wfmJXDRJpvsoCXXoc0nFGu96ev8hu
         9DXNrUv0XV41V1aGwpZQVy4cTfx+OVQ8mb10IeQqWhx5Q06kxAeNTzA2rrwULqigxbaP
         1axu2ANc8/7LyfUVRShqHQCXSr5EBKf7h0ww9Nu1qlQedr8ZdNyydgFe3Y/hSHUEQtxN
         md6XVwV73aQaUMDqPwGkSQkJleRI7BJfDx5SdFrW3qBeSq1elZXc34YIWUqCIFAbGChb
         3qKA==
X-Gm-Message-State: AOJu0YwhIRlttO/5mKCrzaUMsi81AaJBINmtAXf9QDHkRPjwCFcEZcJW
	kxsTi/Jw1Cdq1BO7HH0CQCjBuFGgN1qor5diqP9TfVv+BK6xphEnfzzuhez7ehD1ueP6mX9GSGF
	Uiy3p80sApHjwCGSM0NLZZCRCcE9j3xKkApXY
X-Received: by 2002:a05:6402:2039:b0:522:4cd7:efb0 with SMTP id ay25-20020a056402203900b005224cd7efb0mr18593145edb.17.1693233663018;
        Mon, 28 Aug 2023 07:41:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh6TIPCtn9PEKPVIRU6ZJVDbwx4GJZMNp5RsbThE/4MLlMbNwNeDaDuXhHfo1MSrYC6cJmSkwCym1KGoCnbJk=
X-Received: by 2002:a05:6402:2039:b0:522:4cd7:efb0 with SMTP id
 ay25-20020a056402203900b005224cd7efb0mr18593132edb.17.1693233662677; Mon, 28
 Aug 2023 07:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230825202041.194349-1-hamza.mahfooz@amd.com>
 <CA+5PVA6vBbGK4DznO45gp3N3OEL8ERzyjUfe_fLGMCEZ2NjgYg@mail.gmail.com>
 <12e4c4eb-df91-4a7a-9072-ccfac8679c85@amd.com> <dd01d36b-2ff1-4889-a409-e6fcec60af68@amd.com>
In-Reply-To: <dd01d36b-2ff1-4889-a409-e6fcec60af68@amd.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Mon, 28 Aug 2023 16:40:51 +0200
Message-ID: <CAO-hwJLSMuZNzz04pjBC+OLN+yomu7FNJXtaGH8Nauhe01_3kA@mail.gmail.com>
Subject: Re: Update of amdgpu DMCUB firmware (2023-08-25)
To: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, Josh Boyer <jwboyer@kernel.org>, Wayne.Lin@amd.com, 
	linux-firmware@kernel.org, alexander.deucher@amd.com, 
	chandan.vurdigerenataraj@amd.com, deepak.sharma@amd.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 4:38=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 8/28/2023 06:47, Hamza Mahfooz wrote:
> > On 8/28/23 07:12, Josh Boyer wrote:
> >> On Fri, Aug 25, 2023 at 4:20=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@a=
md.com>
> >> wrote:
> >>>
> >>> The following changes since commit
> >>> a33f8f1abd1df344798188807de4b4397d7484d3:
> >>>
> >>>    amdgpu: update DMCUB to 0.0.181.0 for various AMDGPU ASICs
> >>> (2023-08-25 15:25:00 -0400)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>    git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-08-25
> >>
> >> Does this replace Wayne Lin's pull request for tags/amd-2023-08-18?
> >
> > No, that is updating a different ASIC's fw. So, it's still needed.
>
> But in this case the tags are sequential and from the same branch.  So I
> think pulling the newer one will be sufficient.
>
> >
> >>
> >> I can't get to gitlab.freedesktop.org at all right now, so I can't
> >> pull either.
>
> +bentiss
>
> Presumably you're aware FDO gitlab is down already, right?


Yes, I am well aware:

https://floss.social/@XOrgFoundation/110966947933348638

(and I'm actively working on it)

Cheers,
Benjamin

>
>
> >>
> >> josh
> >>
> >>>
> >>> for you to fetch changes up to a33f8f1abd1df344798188807de4b4397d7484=
d3:
> >>>
> >>>    amdgpu: update DMCUB to 0.0.181.0 for various AMDGPU ASICs
> >>> (2023-08-25 15:25:00 -0400)
> >>>
> >>> ----------------------------------------------------------------
>

