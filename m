Return-Path: <SRS0=zSze=7V=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B010C74A5B
	for <linux-firmware@archiver.kernel.org>; Wed, 29 Mar 2023 14:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E71C5C4339C; Wed, 29 Mar 2023 14:47:31 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 15B74C433EF;
	Wed, 29 Mar 2023 14:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 15B74C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-54184571389so297292907b3.4;
        Wed, 29 Mar 2023 07:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680101250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tG3QLxvhbuGDF3WgQl1FETVC/g3I9RZiZOG/p+wybIU=;
        b=ICLxkgg5fYrRipJMNALtmRRZ/KL487FryJxhmADlHd9BOqgav9VxkCcSDW10QB1tLU
         4UQUXhNJlLmTJzHY0jsSnCNZL25Uq4z9rSySDOP0tWai4SvuNWdC5VmS7vpVTFqrDBJe
         M+oNbEOQ9W9P3Q1PV8OVn+MhAfawofm/j7u7P8V210eG/TGyd6tGVN08LckHX6uwkISR
         XmATSsSV5lmWGxgJp7Qp+9i6qa332kTwMVLse81+U7nWas7d3ugafJ6uvvrY990zgIYg
         v1vzm0uBGZWcQL3ptfHPLjTWUESaKhdZUDrBMzeTjbVlDxofK7iJWhZ4cWKC8EzC8UY2
         YasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680101250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tG3QLxvhbuGDF3WgQl1FETVC/g3I9RZiZOG/p+wybIU=;
        b=ySD0pnp2agSToVBjtwfU6aiSYNDmiLRdO+xH5W+6QE1sC5ENiXDNQ+UPXtL2o21RRU
         pfWud+1MXzz3Iwr3bOrSr5X8jJ/rMdeitza+S96GQsKE73gtqc8lCRb+t0whqrh3QpJh
         kARmHz82Tp7Lo327SgNCJ414m9bm3/4GzPYkXly+ytjcm938eA5CTp4JGdrfeShlhl8x
         gJAnpFDFs+hh8NsObiXKb4EVgVmXddBfombYBNx24IP+DNOZHjvN4iejq2rXZ9G+CEVl
         6sISXL5avCfGrwAkceV6u3jBDFe2ke+niDX+nS5Q7Z8+WeSC746cb0ikK5Cetv13REEa
         OG8w==
X-Gm-Message-State: AAQBX9ezMJLpDB1r1xsYfT76iluU58LaIrhBCq7lHyb8BHXyvDZFmKfU
	4J4Zgzr8estUf8J8/qrkPxU8Bxz3UAEEE/o+6LjQoSkD
X-Google-Smtp-Source: AKy350bruGiHSGjiCORhmkf/5NxnqlF8jFima4BVG7YCEyhQVRIXttqH8Hi/dC1Kn/bzTHmlmN6eU4/eMyl0ubb1pp0=
X-Received: by 2002:a0d:ec12:0:b0:545:bade:c590 with SMTP id
 q18-20020a0dec12000000b00545badec590mr7576665ywn.1.1680101249999; Wed, 29 Mar
 2023 07:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
 <20230301-fixes-and-compression-v2-7-e2b71974e842@gmail.com>
 <CACvgo51S927dpSntF8Y4MmsOQGzw6P21mkdE2RP3n18+djfOEg@mail.gmail.com> <CACvgo50PM4ZhmjOrkCshyxjReSO00fZmjTGJ3hb6OfPEQ7J0dw@mail.gmail.com>
In-Reply-To: <CACvgo50PM4ZhmjOrkCshyxjReSO00fZmjTGJ3hb6OfPEQ7J0dw@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 29 Mar 2023 15:47:18 +0100
Message-ID: <CACvgo52_4VihKSyERO9ZWK=hp7_QufaAf=fhQvRCUtn1LTC61Q@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 07/16] check_whence: error on directory listed
 as File
To: emil.l.velikov@gmail.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Josh Boyer <jwboyer@kernel.org>, 
	Adam Sampson <ats@offog.org>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Mar 2023 at 10:31, Emil Velikov <emil.l.velikov@gmail.com> wrote:

> > Josh, humble poke about the remainder of the series. Would you have
> > any comments or suggestions?
> > Note that many parts can be picked individually. Should there be any
> > merge conflicts, those will be dead trivial to resolve.
> >
>
> Humble weekly ping?
>

Another humble ping?

Josh, are you too busy these days to look at linux-firmware? If so I
can stop the weekly pings (for say a month), yet I would love to see
this move forward in one shape or another.

> Emil
