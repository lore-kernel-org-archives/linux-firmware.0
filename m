Return-Path: <SRS0=Ducn=BF=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FB6EEF30A
	for <linux-firmware@archiver.kernel.org>; Thu,  5 Mar 2026 06:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 821CFC19423; Thu,  5 Mar 2026 06:18:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C6C7C116C6
	for <linux-firmware@kernel.org>; Thu,  5 Mar 2026 06:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C6C7C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6253AChi865532
	for <linux-firmware@kernel.org>; Thu, 5 Mar 2026 06:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FGkSdqZhg56re1eIcv6/71
	Z4UzFtMuJ/c1cgYaVt4wE=; b=ipXQJkq662ivNNQ6etGT5iRkW+sJlpXVThdV0C
	rmnokA4uuCReimYGmTBgdTxqXtDYYZHaWgNjVvO93cBhsc3T5w/bAwYFyUe9S0jX
	GMxAZ7Lcqi30D/VkoVdkjC/2YLRpnny9lZ/zwB9B6uAWWtmbGvSMuWoVsPfHOfCy
	bcBixm2ikh1VtXa2/xaqdmQLPWyPEePw8N6ih8HQ9fjFyLlIvAkvLPvFJscEh/LL
	l4hDSkdiWqkLlmbMrOsmQLpMsqIKQUIc1XpTlRhNWLwbYboIWLY1Uv1ztOIyhYI5
	Ybtn72Z9zYD9XMEimSgqbWLHt84DajhX4Z1iBQW2fKI1jbqQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk0gap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 05 Mar 2026 06:18:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3597baf976dso16904271a91.3
        for <linux-firmware@kernel.org>; Wed, 04 Mar 2026 22:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772691500; x=1773296300; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGkSdqZhg56re1eIcv6/71Z4UzFtMuJ/c1cgYaVt4wE=;
        b=aZTrLQgvyjUav5eZgmlhAtb1c1I4QpLa2r9a6hQdoG37dsJF900VR5zrqehE64ZBa7
         ZOSGmoTNbvgDs1BFlUW72nm3ypdWyZAhvjJ92OP48NZKLbFh6wFJ1I+qY4871GsXemq0
         +8p+32Bo2PEiVWJGIwqmtnMXbARYPTR4qVYqnUdybcOODfMY01SP7z3+N4+QTZ9oR70F
         Qn6VW+yYMOnSMphRf3X75XjpXUCtns13CTVg7zkzzt9ZfTz1WjwQepo0lwyTamkE2uGC
         kLbvYM/zM6x1waiyehpBmapQOUC4edSIQWGXsyjcSvgWJv1eQcK2hKIv5qethEchaNYi
         udKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691500; x=1773296300;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FGkSdqZhg56re1eIcv6/71Z4UzFtMuJ/c1cgYaVt4wE=;
        b=C8KFw3GnbbQqCniJkBUzP4Ta9LUy72/JBWZrm7cY4RJrH8zqP9PIUUxTNZnINwIM3p
         5thvGMg4ecS2RTdbBaZFwwHKxiaCiKXYx5jt+ejkBhrIfRMSKtirPG/0tTZWCPSSRWAd
         XVE2g+UUsKQzFJeilE6sYnOazktIJuLonHcd6Y9GhQaDAjFUOhCx1j/eyIq/Hv62J/bb
         Y7aRBlUU7Nc/V71IRCt7CeOiN78RxFNnZbatEQPex6TzzKskVAzvptZrmzLVPjiymKl2
         bpE7sdOPjTKccFURrmOZ02M6kQFBdkfJlHrLNLUdqdnebBJDZN382eG+V4sF2J24ULrL
         R1+A==
X-Gm-Message-State: AOJu0YwNU/OvsEwOvyufr5KA80WHdclPz/Ya3XQJl1wDITMWzppLW5P0
	QXmUewUOsL0H+EhXMNpK//3tyrc6OSEt8kU1hxgO4zgRybIj6m1QXYse682EsqnooXUUvVTHLcM
	Sr3R9bRB6OOaAp+sovBFBhN1XzvageD1H7v1x6FyAKy+b71EychfG0CnwY+xM02zJ9TKWVfs=
X-Gm-Gg: ATEYQzytKe/Uz8PJFeHQMyiBwd/iByum/Ad9lSYEn+x8OwtQpLleb5f4uSnkQOQ3swC
	JJ9fKc3qhdO2al/PYjXbvygcHjXCROtY8KIgSMS346M3QDUkigr9Bt7UPe2iIrKH3ZNafBkst9d
	95PbXwV7q4X4S8nBLGP31QTtroIp9QRNvRQYMftWElEELZMVBiPukBn7oMbjmu3I5ySfbk2JK8l
	i+gwA1pxA9sEGh83K0iDYb1ir7anfW+eBFX2DsBN74CmSr3XmyWr8MwOfkYKdamCjA3f2vyGNlI
	OLUs0L/nRnE223uG4W0pzxnVniki8sLt9VvRSYJrJ/E4B2zi5IMHZRkUbwi4W9FAFjbm3CF2B4t
	yHv1TNR5/MTTVAEBJESkjVdyfSXJYo6U8fpUqFq5rfmyelUqIBy8R
X-Received: by 2002:a17:90b:3a4d:b0:34c:2db6:57d5 with SMTP id 98e67ed59e1d1-359a6899fcemr4333182a91.0.1772691499886;
        Wed, 04 Mar 2026 22:18:19 -0800 (PST)
X-Received: by 2002:a17:90b:3a4d:b0:34c:2db6:57d5 with SMTP id 98e67ed59e1d1-359a6899fcemr4333168a91.0.1772691499471;
        Wed, 04 Mar 2026 22:18:19 -0800 (PST)
Received: from [10.206.100.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2c1daa6sm990332a91.0.2026.03.04.22.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 22:18:19 -0800 (PST)
Message-ID: <15774628-953a-49c0-8a21-543524cbf643@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:48:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: venkata.kota@oss.qualcomm.com, kssb@qti.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: add ADSP, CDSP notice files for sm8750 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7HLD5PukTPRVNs2A1-2kfIzI1Tm1RIv6
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a9202d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=qC_FGOx9AAAA:8 a=ECcHNj2VKcaoST90NsAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: 7HLD5PukTPRVNs2A1-2kfIzI1Tm1RIv6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0NyBTYWx0ZWRfXyHGyDFV5m90G
 oO4mDOvdIXlEAOzcKGH4tc+66SlhiR+PbN2lAPQQvxwMnpcMgpWOyPcG7Ks+AjdZ1MU6aumh7DM
 Dwm7ugwF4vTXEA6Pyxxzq2DcI3Ly6DtnA5yVaGSbDN5NFAbo9v4hvLwa2dRWQnOx1vj1GvAMXcI
 awwPUju2ty1WeV9BWxA0Uv+nN7chmfOIQKWEyKBn/YAV3eCYOWdGGHbtWh90JGTVWK9ZerDmOf/
 u0VgGLpCpuY7tPr+r7y7k++qr69oMLSijaNzW5ooqjsn71QFVYRanRO8k/tRuiWaPiDQq4W4ErE
 TVF3y7zxEKzI308iyDSiNuQIHonl6+UAGeHE/x67ob128qOYHFN4ySOBxPjWSvF7aQgFlArlZOy
 IOODoyYNqD4FZ4C0af1StL18wvTfGqnDoG6Y4q1d6RHeRGx0M3j0JFLm/DJ9zzs1h0PkOpNUaX0
 mdTJm6AFrEqRTa2CUyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050047

The following changes since commit f69a5e73c0c0c927a5bea53ce707ef17afae1964:

   Merge branch 'audioreach-tplg' into 'main' (2026-03-03 19:46:20 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-pakalanotice

for you to fetch changes up to aa05d14567ea5de6790a4ae199b4ab2ab1025fb4:

   qcom: add ADSP, CDSP notice files for sm8750 platform (2026-03-05 
11:46:08 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: add ADSP, CDSP notice files for sm8750 platform

  WHENCE                      |    2 +
  qcom/sm8750/Notice_adsp.txt | 3214 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  qcom/sm8750/Notice_cdsp.txt | 1270 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  3 files changed, 4486 insertions(+)
  create mode 100644 qcom/sm8750/Notice_adsp.txt
  create mode 100644 qcom/sm8750/Notice_cdsp.txt
