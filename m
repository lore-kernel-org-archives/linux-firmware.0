Return-Path: <SRS0=gmrA=6O=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D279CC61DA4
	for <linux-firmware@archiver.kernel.org>; Sat, 18 Feb 2023 18:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD8A4C433EF; Sat, 18 Feb 2023 18:46:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E88C3C433D2
	for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 18:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E88C3C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id bg25-20020a05600c3c9900b003e21af96703so541065wmb.2
        for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 10:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OAl8dMvtiM3rVbLQvvNINRjKEcdpGMN3lOrDpCydPQ=;
        b=lqHoPREkNVZ8i0VZLs1yZWRznrpXQnLxi0vb5VasoZuWvuUXd1obX/eYS3t7anhsNR
         U5d8Ct22KED3oGQy9Ymp/zaGcgTwtCvHD+rcuViCzEllm0XWU+uLQuZPasl+Bid/aDq0
         Vz46VyqKcrDD5Y5Ezr/zNSxtWv7J8VFiCw0QBz2lNDdVx66i4YceveXxM2qJZxjhdnU1
         AB+YrLv6d9zRiEHG5k1d24fIlXvnvYDsXxC/A8sh0UGKXOy50TakUGdrDsgeA/17NLxB
         0slPg2Ougx3zQZrH5UtslU9mvn5kngNlybtnkyFPBZ2m1sHYMw+Ev04kiIsbv2Vg5nR6
         2JiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OAl8dMvtiM3rVbLQvvNINRjKEcdpGMN3lOrDpCydPQ=;
        b=YCg7GT4wAK20dwN2J0ZLrA+V7vFK0rHqs4v0r278EWQwlyhBVev7uYESeWnWX72cUZ
         PWJNquNSoXo2mkUEb2QAviSrQ23RGIrUs9CMY61ULBB/m2CLIpncMft7zvLYrrYyWr1Y
         Ca3dJ1HRV3d+DqhPLkxzL9d+qSVaFZqBLTTUyiLIaDb6NjCQpDzyJ8ZHO4aVxCDDNafv
         zVEIF1JT0nybpaFLPnCEEQ3gk+el3zuZmTqV8NFEImaGmt02LdSXZOSKs1ge8MZrHqiT
         rQFKTMQyPaziBYCHCweZAgIOnGjjAi52I0tgl5LNGE4ZbAqbOKPyicIFby4EzBm+SDlm
         lcXw==
X-Gm-Message-State: AO0yUKVay3LUnjJJZeOijN4/qjKIEKxYq8tocTbRN5XtpHTqP9V5bxzq
	7gpiQFGNcdxqVhDwncjT7rB153STans=
X-Google-Smtp-Source: AK7set+oBRv3qJAw+DJVjk722RlYCajwC8BmvJF6ILvi8KLWJz5OznssWsIU4nm6tE1qRblTaOUSiw==
X-Received: by 2002:a05:600c:74a:b0:3da:fd07:1e3 with SMTP id j10-20020a05600c074a00b003dafd0701e3mr3604828wmn.22.1676745992865;
        Sat, 18 Feb 2023 10:46:32 -0800 (PST)
Received: from localhost (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with UTF8SMTPSA id 9-20020a05600c22c900b003e224ff61a8sm5383883wmg.43.2023.02.18.10.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 10:46:32 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH 07/15] copy-firmware: remove non-applicable file presence test
Date: Sat, 18 Feb 2023 18:46:13 +0000
Message-Id: <20230218184621.2026504-8-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check_whence.py script already ensures that the files listed in
WHENCE are present on-disk. Thus the extra check isn't needed.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 6bceef3..656b0ec 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -32,7 +32,6 @@ while test $# -gt 0; do
 done
 
 grep '^File:' WHENCE | sed -e's/^File: *//g' | while read f; do
-    test -f "$f" || continue
     $verbose "copying file $f"
     install -d $destdir/$(dirname "$f")
     cp -d "$f" $destdir/"$f"
-- 
2.39.2

