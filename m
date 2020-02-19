Return-Path: <SRS0=XhJ3=4H=gmail.com=billy.kennedy2464@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=3.0 tests=DATE_IN_PAST_12_24,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,HTML_MIME_NO_HTML_TAG,
	MIME_HTML_ONLY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E43DC34047
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Feb 2020 14:20:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0D8E420801; Wed, 19 Feb 2020 14:20:30 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94375206ED
	for <linux-firmware@kernel.org>; Wed, 19 Feb 2020 14:20:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQCeK0Yp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94375206ED
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=billy.kennedy2464@gmail.com
Received: by mail-wr1-f52.google.com with SMTP id t3so736483wru.7
        for <linux-firmware@kernel.org>; Wed, 19 Feb 2020 06:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:subject:message-id:from:to:mime-version
         :content-transfer-encoding;
        bh=/Cc2QZwBAwO2LJ0jzRRccNStGdttQ3bA+RGXBzOgXK0=;
        b=pQCeK0Yp1YCeZ+EEW75SHTatFkbqmn2wrz2QankqlrlWqjEsGamCxN1ehtnqi7Y5jD
         gwqfd9oSEeWCrZrO8OmWjkThVW05AnqWztf8yig/fvtMB58AGBCLqnMm/SZJKTIJ08d7
         4g763BI1DhPpQja+SivN1f7NFeWZXwTiv3cbmgb2nPiKHZtzLReBYZBsNK5jxiReu9Jm
         nZ/REaG1r+VXPy6JOeeIsIYWjpfVUxxuiaxMPs+GSho6VUdKMxhsE764peIvXcQCFAOj
         JHBaqzPyXzMJOtsgwyyiS38tfBBAqfQrtV1Rv1XjAuxRXoxzzoIeYIVF+UR3jfi7RNi9
         H24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:message-id:from:to:mime-version
         :content-transfer-encoding;
        bh=/Cc2QZwBAwO2LJ0jzRRccNStGdttQ3bA+RGXBzOgXK0=;
        b=cWRgj4va+jg9KKKoKwwRP1IT2rO1ES+X4X2b7eCDqmTdxQ34lmPROw1s230hENd7q2
         LypHHlHjZFa6zbI0nNx9/SG4glg1maGMaRKcAzXhkIBOIS5ZdUxwCrKDSGFowOhxP3k/
         3tHk0kfXQZ0FfGW9lq2lAJgXV/wDy7Q3E7/XAHt+o3rGJ6cNr4ID4C8cn8xs6gQt9gow
         SjCJk8JS1/hMdUvWiLoK6xbHVcRfthHr15FDtzf2zYpjyNDX9IDmt2Y3KJeoeXMEQyHZ
         lQFaYie+YeLLqG/SqHr2ZuNqWF991KfUbZa8aTSt5SEVBtquYazujBpVYcQJdQtt6djO
         rCSg==
X-Gm-Message-State: APjAAAV5+2xhasb307oOK3dLPZsd+QX0LNI4ieb8PFUx9KGTI3nrhp1y
	ABMAdlQy1Oj7G7+7ahLemMN+qYTtKw0=
X-Google-Smtp-Source: APXvYqwqlnM8jJg5ABz4ej85r+rARGt+mTrHIHhH9wscFVa18mMbaSqDI8AupEbGQlWjZUu6g4Ebfw==
X-Received: by 2002:adf:ffc5:: with SMTP id x5mr37020292wrs.92.1582122027684;
        Wed, 19 Feb 2020 06:20:27 -0800 (PST)
Received: from [192.168.0.20] (cpc125246-bbrg5-2-0-cust34.14-2.cable.virginm.net. [82.9.243.35])
        by smtp.gmail.com with ESMTPSA id g19sm3210906wmh.36.2020.02.19.06.20.24
        for <linux-firmware@kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Feb 2020 06:20:26 -0800 (PST)
Date: Wed, 19 Feb 2020 00:10:51 +0000
Subject: Multi boot Pull request 
X-Priority: 3
Message-ID: <du26xbw6vxypqoii9q9mvrl-jqcqjp-nff6f2-net7nn-rs20u2g98hlze92xkw-nkrmwv-ufms6j-vy9eh7vu4jw2fsqwqwq7pwtj-omeakx-smlpdk-9fgri7-wvgi8j-cdouby-3pfj36dze7dkrza6kg.1582070877787@email.android.com>
From: "Billy. 2464 Kennedy" <billy.kennedy2464@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
MIME-Version: 1.0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9ImF1dG8iPjxiciAvPjxiciAvPlNlbnQgZnJvbSBteSBIdWF3ZWkgcGhvbmU8L2Rp
dj4=

