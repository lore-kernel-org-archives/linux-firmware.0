Return-Path: <SRS0=93cy=34=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D23CA0EE8
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Sep 2025 05:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25D7EC4CEF5; Wed, 17 Sep 2025 05:02:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C966C4CEF0
	for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 05:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C966C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H4mFGR029787
	for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 05:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yl7NiXnNcw7NAwd66bqqpb
	6nX2pXqy2DhhZjaXkT8h4=; b=fsss+vY1yjnhRfnwJIIyOBfVJYwAZlXMDzE4ih
	nOP0EMhmCMFSQtns3mi2Tc54kMZJgKMPGN3QxWD/trgm8RZY1tw6g0f6gk+DcoC3
	/WGbUW0An7VA7RyKoZY90CCc72afF3zJSNvq+pXNx4athzbauwDJ4Ow9zjStqY62
	Fg/BnKIXbc3mVXm81BM4Uig0V0uwFxY2tLFmKFJP+VtZOZ5RWKM7R3e5Sr9MvGhJ
	RUCnX35WUlMQU4WguHdVLUWJxiIpTIwl2BRZOIeDSGwgmZ26sTma5A5I1cqNCUy9
	S8mL5BMbbJHKELGyj+7Hdo3Z2x5dRZd9tgtABe0cF8gdo00Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy58y28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 05:01:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b522037281bso4327894a12.3
        for <linux-firmware@kernel.org>; Tue, 16 Sep 2025 22:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758085318; x=1758690118;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yl7NiXnNcw7NAwd66bqqpb6nX2pXqy2DhhZjaXkT8h4=;
        b=VDHGT8gWy/bDQsP/skHfTZsMtiEgMnjc5TIjefzHTo9YA3P3T6rLSFuQHT03C3QyZC
         rg/G8YTgZCswzlXq8oqzqMfUwIeR+BPPlXIuW3r5Xxd0HrlhEURpgPmT/J1/wId4JxBO
         pSLUJC/uPnbDosZtwSQXOd+OvOz+888H+wcAJsOAWdRHKUXuOk1Av6QbuEQLhd2kOJ6+
         /zS7GIzdJV8Z1gvxbmNej97WWHoikTKPfenVZOijyDemwx4F1n8+IHKsHqRDhlM3uCZQ
         PANE6p90TFsK3D8qsvCkiCT2He3dt58o33n3gMmvDPlK14ZQkZA90Ybm3i1fknNcXM5m
         Q3+g==
X-Gm-Message-State: AOJu0Yw5Qqn4hhKJ40rBxIkCasXaG9y79REYo4OD15baXGXXgakr5/XG
	2wRYBRSvt3pUmIuk/Dhn+7U0VYnUqpmYpDtxrbdA/8zK2adgmlvoYXXTmOON9oKzj/zx9KqCXYG
	BseCZwG2bi/M4zC2xhG2ILcQ9CjBskr2PsXd8BMDVRoD67y0FwSg7KOOpt/D14vZZ/vNsas9Msg
	==
X-Gm-Gg: ASbGncs11Kyf7l/phci+ue7NNvmI+jXbT5k3K8H8ByqDl/3/7IVsbmFtEc55AdTRHqK
	eYe4oh4TqWtZtWY6PBQyJlLQxOjiycV/bXNZeWIHVTMr1Anmpi1cIb2RtaKg7oDs4bgzdPJU/Kk
	23EfjdS2o9kbnipw9tU8T237YKMgGWJc3DqKpjOOr8G3joSshwHKzLm6JIetWWNPu/ywYhshuqK
	2XVzornSSbXQCpdxZRpy47nGAvu/ufdtSbSHlam/onef0m05NXx/PGIgbvGkM/nSLx+54nonNGQ
	5jpzaudMLLpv29H0sy/xIUGDkqBH/GhjHKstrUuicfqtrmSVjXCuxT4Qi9hwNnLWcPyH
X-Received: by 2002:a17:90b:2dc6:b0:32b:baaa:21b0 with SMTP id 98e67ed59e1d1-32ee3eee728mr1108693a91.6.1758085318024;
        Tue, 16 Sep 2025 22:01:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQhO0D9ruYJIobUgQkuechEG5jvwL9JvDcj3QocEO/1JLvK6DM9Q+BprsY2jGEaidptYTsfg==
X-Received: by 2002:a17:90b:2dc6:b0:32b:baaa:21b0 with SMTP id 98e67ed59e1d1-32ee3eee728mr1108660a91.6.1758085317550;
        Tue, 16 Sep 2025 22:01:57 -0700 (PDT)
Received: from [10.204.86.37] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7761562f25dsm14761580b3a.74.2025.09.16.22.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 22:01:56 -0700 (PDT)
Message-ID: <3b566cd9-40ff-430e-bcae-1136cbabdf11@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 10:31:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: bkumar@qti.qualcomm.com, ekansh.gupta@oss.qualcomm.com,
        kssb@qti.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for qcs8300 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Wn6x_zOhoI7NqTfpLOlkxA9-SIPxexWj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX79VJ/pYLutEV
 FQ73pcxO+HebMyr8PuPQfoKWI0unSPKwJ4LH/0daJ0hyT9Ux52/0vXQcHbDyfzZGGYSIudTjsmK
 UgD/sBJUrSe0Jju2ge1hamVRN/kVLjcosYOnhiBeuuIMtKv/BpToXSJXbZeEOzrkkecfgU2Xd+o
 J7QaKyFkL7YcwrUfZAaoT9/vPkIq+GwrNm5tQCt0jCsO+TXzwLiH/gwyNGoCfRS1Mmq1Wg/f067
 JGxwfBtgUFbPge/uW59sMybkxyHnQF6hDL3cClJICVareNZdC+W6LteOexk1DMfj3i1apzdjkxa
 Xa3pSa3g+DZ7Zu+hQmHQRvEMkCLuIpJ9TUzJ/YQE+ecc+LhNKISAgRR0xA3cLDMgyqsEhjVNRTw
 tyfiIQNG
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68ca40c7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=kwKhpKAzaa4pELOHzsgA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: Wn6x_zOhoI7NqTfpLOlkxA9-SIPxexWj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:

   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-qcs8300_1

for you to fetch changes up to f504dd64f1f5fde3aef24fcecfc165cf8845b22f:

   qcom: Update DSP firmware for QCS8300 platform (2025-09-17 10:30:17 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for QCS8300 platform

  WHENCE                   |   9 ++++++---
  qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
  qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 3080192 bytes
  qcom/qcs8300/gpdsp0.mbn  | Bin 5832704 -> 5873664 bytes
  qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
  qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++
  6 files changed, 57 insertions(+), 3 deletions(-)
  create mode 100644 qcom/qcs8300/gpdspr.jsn
  create mode 100644 qcom/qcs8300/gpdspua.jsn
