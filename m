Return-Path: <SRS0=A5DV=CP=oss.qualcomm.com=dishank.garg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8866F8A14D
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Apr 2026 09:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9769CC2BCB0; Thu, 16 Apr 2026 09:36:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B9907C2BCAF
	for <linux-firmware@kernel.org>; Thu, 16 Apr 2026 09:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B9907C2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G81XeX3734339
	for <linux-firmware@kernel.org>; Thu, 16 Apr 2026 09:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=ZbB+gskVsm3u3ity9l1n8N+6IGmYz331mYjSRLqqitk=; b=Xn
	CnHTtZHWl+xDGeB8J+TQvUPeXAN1R8Ew4ilGkqQAg/nu7NOFruPKNw1XSUoJnQ6n
	BK+QIxmpmCIXTmWKBmt5riiGG4FjpS+IoNEdWhpGrcfdieVHFgVOMFbhru7dzt+v
	06XdtWM9p3XwpbhBAfbyDEMqI9qbqZA67LWye+Bt+1xf7/EzrJsXj85x2UzQ0ABm
	z3c/pGHOOZ98Afc2upl7PGLpv2oJIbU7KHPqAZzmxRiCjFcP1PL/JDqFu1QvL0tJ
	3Nw+8Ic0YPNIvDs0bAgU1bGYYrQyk7ANpIo4tI1Ruhb7PUcCR9EoVa8XVeOvFVSU
	eoxeW/08m6hoqsN0tJGg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djcqwkem5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 16 Apr 2026 09:36:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3594620fe97so20399523a91.1
        for <linux-firmware@kernel.org>; Thu, 16 Apr 2026 02:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776332181; x=1776936981; darn=kernel.org;
        h=subject:cc:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbB+gskVsm3u3ity9l1n8N+6IGmYz331mYjSRLqqitk=;
        b=btVeORzsa8ZjHLrf8K5RrZUA6gIVMkzxOPtUl3EVnfBHBCpAal2im5SyVKEB4EwgHR
         c5Kgc4ztvAfMUf4yl7oIUlClI146A+gvymtt89xkZ/cSymUz7Z9SvcBFVBsAoB4ZAa/J
         NnuIffHh+k8ZhDJ90mtOLQx2cw8NGv2G5uyIMKylHtm+9EcFdkX66IBOW2rIm9WES1Cf
         wB5PXbN/bTZ++aCq6gHpkV5DkxR8Ie4NVYt4ygQt86EvrtdBR4OMHqfd1NGMsV1mYdeI
         0tDwfayridRdR2bEF337AeyVzHAC/bCWlk8WZQ9qmtQutuxNbf2nERwl5EcLLk1+d5oF
         Urcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776332181; x=1776936981;
        h=subject:cc:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbB+gskVsm3u3ity9l1n8N+6IGmYz331mYjSRLqqitk=;
        b=U2+T894ozeiyq2ThtNrzsQb5I/cRyzZ+XGXkpXXe0XwVsj/rsqfYsQReOj1gisTpBn
         3qgBbJLnrcXve1MqIv8IjWQdY5Q75dSSL7S/jCjMlcWSAbN9mJJaaH2eoyOHBtUyAbXY
         o6Jqh2B2tnyczSS17nB2OvHH5QFYpWB1hC0bG3t7PHXKYCIC+AH4SYBm8nNGXThwqWsR
         dILpiWAL3jMZeaoaSvGi6Bt+RqOVVm9+ij50W4aGDNkxHFOs1kX2gSNAxp9TPaRAZcNW
         26gOvimdSZhYFjRQ4J7HoLg7I3ESsrh7vJ+oWgtjLqv+vXq1sMf0tzdAQgJ3MwmDYc8B
         RI0g==
X-Gm-Message-State: AOJu0YyUL+lB2pm44U/NsizxZlUQFKn7x1OHJizDQ/XuvOD7eGBvuIoL
	VBi2quabP2EwIHSpDLJiV1MsaLD665Lf8TjK8efuiPLWZv7Yrru7mEKyM+M6brY0/r5yBaMnnCl
	wba7z0x9oZveg0V+mo5EzH/jupaCmGjS13WlkbCIwypoUstbj9eVXw9nCbbPSydYREV0AZO0Z/Q
	==
X-Gm-Gg: AeBDieufFuuMytsXnk1TgDJjMSP5dU4pnz0jUQwS8qL5otMdJGGB2e+2FnG/0zK9caR
	j546a9iJRns43GNOyFpCqaeIC3qBAW44A50UDajtDknd/ZOHp7YzyhCUdWGmQeeVTdLUGzppQQo
	1/boUodVkyCreV+8RhwjIi6uTpIKLkUix5bHhlrebKGoEpNU8+zZ/uC9HEglLdRVOjkmtNFtC9A
	RR7tYKVq0KfeHNuQY9H8m8UfKZe6wPnngLk9SF0pTaYLdTe6o/8YMPm5985X8/opvPpaaqttvuL
	ttpeYhwfa3ABl8w1ameQBeKfAB/GsIoWf5DQTx/NG2OB2gRGX+KwN8khlWXv0hwskAo7TKlyfvw
	s1APgcPxv1H45dTd/fo9RgtnY8yFInR6a10sOJrp4D3QyWkQZ
X-Received: by 2002:a17:90b:2890:b0:35f:bd29:75b9 with SMTP id 98e67ed59e1d1-35fbd2976d8mr14074280a91.22.1776332181043;
        Thu, 16 Apr 2026 02:36:21 -0700 (PDT)
X-Received: by 2002:a17:90b:2890:b0:35f:bd29:75b9 with SMTP id 98e67ed59e1d1-35fbd2976d8mr14074227a91.22.1776332180488;
        Thu, 16 Apr 2026 02:36:20 -0700 (PDT)
Received: from [10.219.1.40] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36132d0157bsm1765212a91.15.2026.04.16.02.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 02:36:19 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------dvCWFTOEPz1Gy5bSk4CPw80S"
Message-ID: <65ab0292-4be1-4188-ab7e-4517ef63b830@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:04:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Dishank Garg <dishank.garg@oss.qualcomm.com>
Cc: dbaryshkov@gmail.com, hbandi@qti.qualcomm.com, janathot@qti.qualcomm.com,
        mohamull@qti.qualcomm.com, samana@qti.qualcomm.com,
        ysiddu@qti.qualcomm.com, dishgarg@qti.qualcomm.com
Subject: [GIT PULL] QCA: Update Bluetooth WCN6856 firmware 2.1.0-00665 to
 2.1.0-00666
X-Proofpoint-ORIG-GUID: lC7AVhc9ZO7DR789PgwvEr4RarUl1Qsi
X-Proofpoint-GUID: lC7AVhc9ZO7DR789PgwvEr4RarUl1Qsi
X-Authority-Analysis: v=2.4 cv=XOIAjwhE c=1 sm=1 tr=0 ts=69e0ad95 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=r77TgQKjGQsHNAKrUKIA:9
 a=NEAV23lmAAAA:8 a=bRGLi1IeIIGvqbYhCi0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=J_qYL4d-FKvxD9P5qu0A:9 a=_W_S_7VecoQA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA5MCBTYWx0ZWRfX+3tShB/NoPOw
 5ZsLiZGalVne89C//NW9HfHpcr28r/pkgO2d83OjFJlexAwjKw9Iktm7WjncKL0RN+vq7hYxtTT
 B1uwIdcYIr/ebA4m4HiqUWP558L5hE9YS65KqdwAWS5Wq6ArbmYaWEeDSCbCYR+YSnZGCWlju86
 Plif196abNHVlyJE/CcrKLoRomNMNV6z8O4lAkvDRlz6zD+fAPP8ReMSbSm9ivSL7Jeu7tRiKGF
 FewfMI4UyfNXBvFThSq1wg2ikqorzi/Sq1vgsdFboSqgKCVUv2gs3wPFd9OxJIQJbgp0YAVCkPe
 3Hla2inNcezrSO9PHVauHB7U3s21j43SK9KtIsQjOdo0xu1/495zGy1f4xfWDJodiIJMyT0n3jg
 n2tcQvK7A1HqPnjsZ3Q+pu+kNfH57Tj7HaA8KoLb62CflA1sX1u12uevzUhvJicbdCDz+VbxxGs
 rhMnTBgXUDLKWyqAZaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160090

This is a multi-part message in MIME format.
--------------dvCWFTOEPz1Gy5bSk4CPw80S
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi linux-firmware maintainers,

Here's a pull request for Bluetooth Firmware. Please let us know if any 
issue is there.

The following changes since commit f48f551a902b3cc6e6aa8854e533902d3222a0c9:

   Merge branch 'robot/pr-0-1776148994' into 'main' (2026-04-14 13:01:44 
+0000)

are available in the Git repository at:

https://github.com/dishankgargoss/kernel-firmware.git 
<https://github.com/dishankgargoss/kernel-firmware.git> HEAD

for you to fetch changes up to 6c407931301bb636b3f089196cdd7893ff2d9c6b:

   QCA: Update Bluetooth WCN6856 firmware 2.1.0-00665 to 2.1.0-00666 
(2026-04-16 12:53:01 +0530)

----------------------------------------------------------------
Dishank Garg (1):
       QCA: Update Bluetooth WCN6856 firmware 2.1.0-00665 to 2.1.0-00666

Thanks,
Dishank Garg


--------------dvCWFTOEPz1Gy5bSk4CPw80S
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi linux-firmware maintainers,<br>
      <br>
      Here's a pull request for Bluetooth Firmware. Please let us know
      if any issue is there.<br>
      <br>
      <span data-teams="true">
        <p>The following changes since commit
          f48f551a902b3cc6e6aa8854e533902d3222a0c9:</p>
        <p>  Merge branch 'robot/pr-0-1776148994' into 'main'
          (2026-04-14 13:01:44 +0000)</p>
        <p>are available in the Git repository at:</p>
        <p>  <a
aria-label="Link https://github.com/dishankgargoss/kernel-firmware.git"
            id="menurima"
            href="https://github.com/dishankgargoss/kernel-firmware.git"
            rel="noreferrer noopener" target="_blank"
class="fui-Link ___1q1shib f2hkw1w f3rmtva f1ewtqcl fyind8e f1k6fduh f1w7gpdv fk6fouc fjoy568 figsok6 f1s184ao f1mk8lai fnbmjn9 f1o700av f13mvf36 f1cmlufx f9n3di6 f1ids18y f1tx3yz7 f1deo86v f1eh06m1 f1iescvh fhgqx19 f1olyrje f1p93eir f1nev41a f1h8hb77 f1lqvz6u f10aw75t fsle3fq f17ae5zn moz-txt-link-freetext"
title="https://github.com/dishankgargoss/kernel-firmware.git">https://github.com/dishankgargoss/kernel-firmware.git</a>
          HEAD</p>
        <p>for you to fetch changes up to
          6c407931301bb636b3f089196cdd7893ff2d9c6b:</p>
        <p>  QCA: Update Bluetooth WCN6856 firmware 2.1.0-00665 to
          2.1.0-00666 (2026-04-16 12:53:01 +0530)</p>
        <p>----------------------------------------------------------------<br>
          Dishank Garg (1):<br>
                QCA: Update Bluetooth WCN6856 firmware 2.1.0-00665 to
          2.1.0-00666</p>
        <p>Thanks,<br>
          Dishank Garg</p>
      </span><br>
    </p>
  </body>
</html>

--------------dvCWFTOEPz1Gy5bSk4CPw80S--
