Return-Path: <SRS0=QnlO=TP=canonical.com=vicamo.yang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F150FC433EF
	for <linux-firmware@archiver.kernel.org>; Fri,  4 Mar 2022 15:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA932C340F2; Fri,  4 Mar 2022 15:01:12 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 298EDC36AE3
	for <linux-firmware@kernel.org>; Fri,  4 Mar 2022 15:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 298EDC36AE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 51DB23F1CB
	for <linux-firmware@kernel.org>; Fri,  4 Mar 2022 15:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1646406069;
	bh=DmFax3LZSalpFiojoEblp62J4NHH+vngrBt4SmdiErg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Q3wO/qOvPkWDr7iQwb9qVGxT8m2hGm5rgXLi2V1tefH0W2JjcCm1nPnQpaLf8BDvZ
	 9zH+bWSfThoNp807IY0Z6ReKGTvGey+Y11zdX7I8Ej/atVZHpKw8O0BUduoXHSYXsS
	 KuAA9C0LAVPRDa7lS55RAQdlJQUo5wY/tpzunaZ/otYvkBVvJ6s9XgdMYkPrlC+Xdx
	 jhazFtHZBtW1zDW9IpGBCrN870bsKl+jFaW4gk/QABfHQUxF7eYEOEyeUEEPkcngX8
	 VGIuTp4BymsVSaIdOyJACrrrLsCoBLxA/WMdF3x4d2Pjgg5O0hsvCZaAxOAy0Swcm5
	 aMay+lKjspukw==
Received: by mail-io1-f70.google.com with SMTP id k10-20020a5d91ca000000b006414a00b160so5594849ior.18
        for <linux-firmware@kernel.org>; Fri, 04 Mar 2022 07:01:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DmFax3LZSalpFiojoEblp62J4NHH+vngrBt4SmdiErg=;
        b=rBHmOPW9Ii0WOB+yXfz/LzoQs37iQNeQ+8I820fmU/xWGLD2Q0tFRmYYtbZJtEeVly
         di5z/6Ulvvld/HIGbHYbWVIggmhONITwZ+Dj1aEMrZ3nrpA8MyWlnIzEcVebrNPetWvb
         jV9cBzLfa56JPIIYa4wfd42UD3ErXAQzFHFLt0pZ4tK0pNQp7Sh6bIKzI8TQBcz545Ur
         HvkX8Nn/13QK5ve6bPE1VrRdbTbeAz7zpjibS3ZNDiRxVV4W45BTM52vpnq+82lfp8Dp
         ZsSlzEZ8YqZ5Paqt6VlyubnienQmRwORHCQilaPk7hONwNfzGGR3UIofpA0Q61+cwG8b
         Samg==
X-Gm-Message-State: AOAM530SJQkbNs9d0LXftbZiwpFjdbhXvZUXt0QhE1S2xc3/JFsXUMqy
	eKIzrl0YlQTj4NkAy3YK2ACouOubamFGQCPnjzpD2aoS3zZL2veZguCQH6fBw5DGjj/0Lq6D5Rq
	0iKQ9Xft33Ahfauj9IJLFPwyVPD3EcPZDd3rSMC275mMSYHK5Yz/wtw==
X-Received: by 2002:a05:6638:381a:b0:314:e62:27dc with SMTP id i26-20020a056638381a00b003140e6227dcmr33584974jav.59.1646406068097;
        Fri, 04 Mar 2022 07:01:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweoydln7fzPdEY100TIffp0fujFa/bOcsOFqp3xnwoWcYigiVMEOySmhXMqgNtW3yRswh8+zAP90k9dC5gapc=
X-Received: by 2002:a05:6638:381a:b0:314:e62:27dc with SMTP id
 i26-20020a056638381a00b003140e6227dcmr33584954jav.59.1646406067875; Fri, 04
 Mar 2022 07:01:07 -0800 (PST)
MIME-Version: 1.0
References: <af43569b2247f7aff44b1ea3680d88dbe083d78d.camel@coelho.fi>
 <CA+5PVA4BbLaze8-c4R-8LESA9UhsDAJu3_FK4GZKUpVUkPKDrQ@mail.gmail.com> <CA+rHWAL+JDKJVvocS_JX6CtJ4JUDf_wRMCQ-T1ejw+gT2LOekg@mail.gmail.com>
In-Reply-To: <CA+rHWAL+JDKJVvocS_JX6CtJ4JUDf_wRMCQ-T1ejw+gT2LOekg@mail.gmail.com>
From: You-Sheng Yang <vicamo.yang@canonical.com>
Date: Fri, 4 Mar 2022 23:00:56 +0800
Message-ID: <CA+rHWA+RsguE_UsdCN8QfotvfTSt9VUkY5DM4nvU=bZQRMHvJA@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2022-03-03
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Luca Coelho <luca@coelho.fi>, "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>, golan.ben.ami@intel.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 4, 2022 at 10:58 PM You-Sheng Yang
<vicamo.yang@canonical.com> wrote:

Wrong thread. Sorry.

-- 
Regards,
You-Sheng Yang
