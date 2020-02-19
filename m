Return-Path: <SRS0=n8uT=4H=gmail.com=jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A6FC34047
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Feb 2020 12:20:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4524524654; Wed, 19 Feb 2020 12:20:58 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F26D0206EF
	for <linux-firmware@kernel.org>; Wed, 19 Feb 2020 12:20:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zczor4pk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F26D0206EF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=jwboyer@gmail.com
Received: by mail-qv1-f68.google.com with SMTP id n8so42581qvg.11
        for <linux-firmware@kernel.org>; Wed, 19 Feb 2020 04:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QKOXA3RiGA0/cfb6aGI5dkCTtOqICQiIShB2mzmTTaQ=;
        b=Zczor4pkcnP4/ihDBTW+lc6/ONdn6AJ9cLLk52lOXEHfTXGSQEEDRNAQGEvvytjZSD
         d7JyC45cV1EeRYJvLxsGAhpiQa6uiswR99IgKzE8/62KXTdRjbHbTX/wGNT2+qsSKOJD
         DPVdvxSac/gEAKDpx26m9TzGIlx2nPgqlrho6W2XgrFEIRPjwkMr9Ejhf9AbnrSmFUbT
         fTsNfUNk5TNZB3x8ByqNWeBPZIQ2AuOE+DkzxZBdv5QjsTNrCZqQY8XLFa9gZW5J7GUw
         q6h3j2uSf40rHHGBdMleZjAJ93P4/+gO0+gn1o9hv8vCEQ6k2+6fc7EBcRDYOGgngMzP
         u9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QKOXA3RiGA0/cfb6aGI5dkCTtOqICQiIShB2mzmTTaQ=;
        b=ZGFUgi+GsCqPR4zFvZ41gQ9f0LVbTM3EUmlrYggXZswbauHafktDBGEK8y95whwvOo
         bhl2KVn5Xmd9hKuf82ygFKlizPaD8EGP8TUMe2xWun5fiewN+q1nhn9cbgdnyfYRvfFP
         A+IUjye3mKmniL+RQ9ISPXU5IJGsu2QhFndjxWSfOrGcSMoy2aUGRXsQEWfSGOBlNqz6
         YApiLamIT7j7Wh/dXur2jP0Xl80dVLzi58/d2wSdY/4j8K4sL4F2zI7X3IXnicETpERC
         sU+W5HHBxxyuNq++Z/iIb7/tHlyiCMQJdtliWvqym+asAVaaINEp7RlpDLTd21bkhHkA
         Xy9g==
X-Gm-Message-State: APjAAAU0Q++0/SzQO9pBzgHMqxkfrV8auy65ChakoeY8nIiztfk6+Rs1
	R4roh3RKld/+/29Ky/OJE6hJj9PEfUNXhtEzxfKfd6n4
X-Google-Smtp-Source: APXvYqwm1TkpDQgBpTPrUc60wvb+9u70YInmjc1aWlpye5VcHz9kVkSNksv1pd32qeR9kPOnBIznF/Qsi3pCSSj2DJQ=
X-Received: by 2002:ad4:4dc3:: with SMTP id cw3mr20549803qvb.130.1582114856905;
 Wed, 19 Feb 2020 04:20:56 -0800 (PST)
MIME-Version: 1.0
References: <20200210202726.ooo3hfrslj2krkoa@chatter.i7.local>
In-Reply-To: <20200210202726.ooo3hfrslj2krkoa@chatter.i7.local>
From: Josh Boyer <jwboyer@gmail.com>
Date: Wed, 19 Feb 2020 07:20:46 -0500
Message-ID: <CA+5PVA4Fsv8HqZOJJSY+sGRD+DCi=jjRCi9BDTuo_M8frp2RCQ@mail.gmail.com>
Subject: Re: Linux-firmware is now archived on lore.kernel.org
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 10, 2020 at 3:27 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hi, all:
>
> After a conversation with Josh Boyer in the #korg channel, I set up an
> archival location on lore.kernel.org for linux-firmware. It's not a
> "real" mailing list in the sense that there's no subscriber management
> outside of opening a support request, but this should allow you to use
> get-lore-mbox and use other niceties like archive search.
>
> https://lore.kernel.org/linux-firmware/

Thank you, Konstantin!

josh
