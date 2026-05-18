Return-Path: <SRS0=Hj57=DP=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFD9CD4F3C
	for <linux-firmware@archiver.kernel.org>; Mon, 18 May 2026 10:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A19C7C2BCF6; Mon, 18 May 2026 10:20:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE09BC2BCB8
	for <linux-firmware@kernel.org>; Mon, 18 May 2026 10:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE09BC2BCB8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5bIYA1696574
	for <linux-firmware@kernel.org>; Mon, 18 May 2026 10:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=z2jvne9bRaDwY/C9EWEDsV
	f8jVu6uD/556Ip0hjYV/o=; b=GE5+C63fmqcH2QaFtDuJyS6c7QLJ2+PK8WJ6HZ
	Bevxy+lqEJQC9oBHAKpVfAyXAkyC/zvRHGNKQHh1Fdj2gWOir4d7HBo/8zlIxjLn
	nQzv36EvVb+Z5HIE2PHJT2L9zkkKAwmKxz3QgGF09KcxBdB/DU6ZL10caOwe9EeC
	+LwGmZaOTe9kXp0ZO9AjMnhNrS9Hnt3xX6unBWJsqIexYYvCpwTJS46wvpshdEqn
	P+2YmuRwX2YOomPuvgmNtTbQ2y+gzXztXDOLsWqo+NTwpXyRcrdnrlSyLDFQK8Tg
	nXbWX0EYBVKq6uIKILzfo4OXgAeHcyQ4ifeYoZuc02uHilLQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7vsk17jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 18 May 2026 10:20:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8386367b23cso1507464b3a.3
        for <linux-firmware@kernel.org>; Mon, 18 May 2026 03:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779099652; x=1779704452; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2jvne9bRaDwY/C9EWEDsVf8jVu6uD/556Ip0hjYV/o=;
        b=F4fvEI/y5L01mABeOK8hO/8I+b4j2MJcqQo6Ql3YD1wVm+0AOI+riiOnqG3pTD5L75
         R3nRvN7c+EgxVq+3B75L6xwcPeBf8img0h7nqQhhrxc/RKEB7H0kAO0yM3i/Oo+vZXjd
         eAWQtTAmDdZ3EcWTsnT/JDQQ3koospnmaFOSSXMWQoDtR08Pi8aB8vY2Cn9nEWlZESYX
         5auGVSmVXkWZ9Ar7+AOIj7E2raezFWlyA1WifSt/bmj2l3oIatf8c88TYvNzBMXRb9GV
         g41wY1V4HNHwL6EZvr6fFqweJSyMpYzwEUBxB9IaIPLMVPG9gfbz4hlOTaAo7NJFmFna
         opXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779099652; x=1779704452;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z2jvne9bRaDwY/C9EWEDsVf8jVu6uD/556Ip0hjYV/o=;
        b=b9yYLX+G2hQQ4ENEIhWSvXqjITN+GmbXcNLCNNCSRDwJxV3+UnJ9LY8XRc4sx62SCO
         8jp5ssIOumpZZZMr5jGPaj+Ol96kFYovBz2j/KUhUywu7xlDgrMvF5yU6SJ026YXzWPu
         2b0IxQc22qxEzybCpOd6F5BSkYXT+6p8SC/z7N21navMLtB/CItDgfN8LB093EQjg1+d
         Tij8/eUEETa808KKom25OcNPk6Xjjo898EK4Alo92tyHLaxLDenJ5Dr3aNrbzLOT8CnB
         J23VjcuCATIJ01YRcM7Vk5F+wTHvn6RbNrLPhfeU4aNLgWkg+XMhRX269XZOIlrMhX7I
         Ghtg==
X-Gm-Message-State: AOJu0YxNMDUgUkVlUtAzBaTSETnJXVNiaKYNE/a5UdiAvHvotFlbFs5a
	gao/e9CR3ZGbrYV2f1NoESGuoRFu7hfXcvU/Luzq6yv24t2jI2/Ot0h63CPVPoG4rk078WITeqM
	N00f6szb4Si9VNw4EbNjG5llkGlex/Av22eC/aN5mzXIwra342Em7hpw9wfB8RgCnZ31WlGo=
X-Gm-Gg: Acq92OGQV9juktk/XTaB7Ks5+612i+Vvf48kYxWZS8Jk1EpdWFK4JpZNGD6YWRZWxEU
	LeOHJGSeMAkCifc4gGy/PYKJb8qbgqSoyQvj7X75Uv7SVbSToUMl4H2Sz00RmoZfC38ZR1sJtU5
	V1xtcACJtL3LgPJmKrfPAzxCbAos00VnFAXMFyjScNcxGA5PBLSJ4YzwshC97pTaGDBoWoHRTw3
	O2/mSHjQgJsxWqKfxBE2SA/3mEBRx8acWFV0XV4U9Gdwqz1LGwGr4TfhgRyW3mNBWtyzcqR72Tm
	TB0OQ5wX+V1uvQaFxPnEXkYHfCYHqDkreVBBWVibh0CEptH/07TzeeLLJD0TUBSYh7PMaCSOJ/e
	AKcG1JfhSCMxRkqM6uZorhJbTyIUpMijMAw9/wFvejFMVfMC5mq8=
X-Received: by 2002:a05:6a00:808f:b0:82f:2226:5aeb with SMTP id d2e1a72fcca58-83f33c46738mr13688077b3a.20.1779099652328;
        Mon, 18 May 2026 03:20:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:808f:b0:82f:2226:5aeb with SMTP id d2e1a72fcca58-83f33c46738mr13688050b3a.20.1779099651848;
        Mon, 18 May 2026 03:20:51 -0700 (PDT)
Received: from [10.204.86.188] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196660f9sm17572373b3a.10.2026.05.18.03.20.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:20:51 -0700 (PDT)
Message-ID: <306f9b2b-b162-4aa0-85b9-de5146ddf603@oss.qualcomm.com>
Date: Mon, 18 May 2026 15:50:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Saddam Patan <saddam.patan@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: add CDSP firmware for shikra platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5OSBTYWx0ZWRfXwPoOzAHLzjI+
 1ENo4/+5yu9M8SQhjV177hAQesfp2XZigQOigp3AY4YofA8P+ADqbMktwKzmgn9JB05YBUG0dr4
 5ESQexAAQfzCUokEKloP+Cs7fUyiNqP2eBBhhbwsu5GviLB5y0EtWBNNLU65cRdND+T2PSaDfCj
 MNHvOOcXVXFQec5ad1QtlPH0a6Lg/mcK9CcbaT3rmgPKd/r6OB3YPmV3Ve9Gu3X1/g6R4NBAgSC
 pThANYMQ0U+B53Xy48rzSfpoOC47EWRTD641wQ2bfZGokidV37WfsQUGa97YkEIGEUf9NHsPdgb
 pLDOE79UrBwTziHVba9gPFCL6SJiUww48q3BTdCFcTuzcQUAKMhcAliBk2rTP2jdBpp1dGEvYTN
 Pg91PXa3aPHZn4YFUG+dK6cer3MpAKhOOETtU7oKlQDklnySC5nuVNPjbm6j9q6FkKEZQmRbEdx
 fru18r4+Q1KinpAqhxg==
X-Authority-Analysis: v=2.4 cv=Bq+tB4X5 c=1 sm=1 tr=0 ts=6a0ae805 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qC_FGOx9AAAA:8 a=E87kyKzIUZF54U7bst4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: QMmbtRmyNvfZWoy3ZePVJe6_2zLKZNEJ
X-Proofpoint-ORIG-GUID: QMmbtRmyNvfZWoy3ZePVJe6_2zLKZNEJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180099

The following changes since commit 5b2bc2e7d14c56e14c59a3d6e7b5b0641dc45c88:

   Merge branch 'robot/pr-0-1778742898' into 'main' (2026-05-14 09:15:02 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-shikra

for you to fetch changes up to c2777935a177a9843e92d3dc34e75eef1e75e1f3:

   qcom: add CDSP firmware for shikra platform Add CDSP firmware for 
shikra platform. (2026-05-18 15:37:44 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: add CDSP firmware for shikra platform Add CDSP firmware for 
shikra platform.

  WHENCE                |   3 +++
  qcom/shikra/cdsp.mbn  | Bin 0 -> 2614680 bytes
  qcom/shikra/cdspr.jsn |  22 ++++++++++++++++++++++
  3 files changed, 25 insertions(+)
  create mode 100644 qcom/shikra/cdsp.mbn
  create mode 100644 qcom/shikra/cdspr.jsn
