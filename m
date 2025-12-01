Return-Path: <SRS0=uh66=6H=oss.qualcomm.com=yushan.li@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EADD116E2
	for <linux-firmware@archiver.kernel.org>; Mon,  1 Dec 2025 07:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 540B9C116D0; Mon,  1 Dec 2025 07:09:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F17CBC116C6
	for <linux-firmware@kernel.org>; Mon,  1 Dec 2025 07:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F17CBC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUMbK1H2589772
	for <linux-firmware@kernel.org>; Mon, 1 Dec 2025 07:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BHiuWpiojsHqIaHqndx/U8
	bjMj0oXJHa3kqDzZdJOAQ=; b=H86Fr5sEeciUY74ARmSmn3+A0jxigYa8p8rZ1I
	VJ4PpM5MtIP6m+AlPGg0McErpVw8vhF7izExVNU8I07jU0Peh5DCJVKdMQBdmsy3
	pYSTi7xxJmAK0VcxCXjH7tAKwIWFVWwCbi5O0LPZq/SSvbNnoIZySaP6JOS8jwxw
	SwzqEseR3FoMSQ7YSQOnNOo25IGLgTTb6V59+wFPV4nAnhFSXMF0PrXsij+3jgFw
	6r+iUkGgMoEluNofFRv7sOD3Ow4JDMslTt7HHltF3WqR/vPmt81cXE5l/NLJjI5U
	v1E4BVJIWdNIN2WM22xHdC3p+ikGwGYwBDyIHMx/Uz8RcRgw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4arwnvs0gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 01 Dec 2025 07:09:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b80de683efso5701616b3a.3
        for <linux-firmware@kernel.org>; Sun, 30 Nov 2025 23:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764572969; x=1765177769; darn=kernel.org;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHiuWpiojsHqIaHqndx/U8bjMj0oXJHa3kqDzZdJOAQ=;
        b=GXOaQZiHMcG1+JYvzFu/VWrUhFGUqTXkKIU5vaLxrssKJbBuiEdQA7EYhhFGIlnLUC
         bOcHYz1BWrzjqOJf5wrnmxqk0kVQjET5az+dUwMAC4HXwdOCWjugPN4vucxLcICovY5b
         BGbHZfKXVV2t2lZcARUEweAvrRqje2frqN/I37zGXql4hgnVEuGRa3fgbBb/MFAUZ/RE
         o9E0OhIw/dE6IQmSBKvgo/5w5C8gwJpI2CbSudf5tOzqvA+RaQY/crLTZVJJJFNzQjgQ
         n9u2vDWtDdOkGCuiqXohtP1S9AqgnhF1K0AFSoo+CvSxUf/uzHmbBuN+WfXMFHGxD8rT
         0wdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764572969; x=1765177769;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BHiuWpiojsHqIaHqndx/U8bjMj0oXJHa3kqDzZdJOAQ=;
        b=hMW0zEu6nXf2HD4P3x9GzVhWNvaBRwu5rEe5jx/gKE+wKXGfUC1KVx5Ch1z94mifhr
         2ouxdv2WrmUehAKOAZXEPeH2nOKpRetyrWtUBFwG/F8srNaX5pzRHPC3X0ydhBn0gMOR
         XggVsEto9YOgHSSeQijXkqT/Klm6uRNEWbFanZ5UwKpdWATRiLMX7SbzRUsZO8USoxW0
         wqjLFtfrsw/e00m9XLYsIkf2jCdele9D21UpNSSAiS5cNCMq1QBpoldSxgAKah8n97/C
         dkaSDK9tEX+vES9bswG3GQm5QY3CPQeiS17cQWquyyQSN/qv5LF/FZ1+NW4dzIg807vh
         tvYA==
X-Gm-Message-State: AOJu0YzPoxVDptPMxy6kAPeSP9ofOC1Ps1oPGzNBQzfxDMB6jqUod/y0
	2mbxZMmyqKP6N1sjmadaJt/b1YO0Z88j4sLXNUiQklU2N+QYqDVD5THr2qGXD3YJthJTpYHmD/N
	nzWsREO7fICThmsTFIU0sG3o/Xwa7JuI6sr2AYq1SY20mRgrC66spK7YvXl85ce+Ga/bQgMg=
X-Gm-Gg: ASbGnctbTpDvpAUKx7+l2+G5/r7mAtkaN3pOG+psYhrSizXYr8Nb+iCkIdNk0O5k9To
	CrBrnkp5prbFc6xK5YEW9R5pc7B8p6doPrpt4iUrF8wbbMM+qKwzoEI/fiuq13221zFSclVnKsr
	B5XR+ieCBNbVIElbH8zvKn3t34AfbHpgsVrlGbro2ORYzNWbnyqS4ChwbwFnQLKzxOKTOzexAnx
	GCvWbEqIzBcoy1XI5b3yOkc0GgX4Oa1C3uRGZ+W0xM8xLCeLwOPSNyFUf0RZcOtlafqpuophLRB
	SstgnE2yRfLByUOA1gYVb/mEWfYMYtsxbPmaFgoQeTETDbSRdmjqHS/EIPD6Zf+sWI3xEXkmBgq
	9uNVtPq0m/xck6J5VYb53WMOPZYdKgnVJ/f4tySDF/Lo+7gJBwcto90Eevcm5D1vDAQFb3h5noS
	zU
X-Received: by 2002:a05:6a20:1592:b0:35d:d477:a7ff with SMTP id adf61e73a8af0-3614eb798e6mr41988563637.21.1764572969035;
        Sun, 30 Nov 2025 23:09:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcgxYu1g9CAF1Zcuoolv/5YS9v+KqPdsvLzYNNTsftUv5yV+JTNlA7G4MBH2KDWyxDreLffQ==
X-Received: by 2002:a05:6a20:1592:b0:35d:d477:a7ff with SMTP id adf61e73a8af0-3614eb798e6mr41988532637.21.1764572968483;
        Sun, 30 Nov 2025 23:09:28 -0800 (PST)
Received: from [10.133.33.67] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb24944fsm11029623a12.5.2025.11.30.23.09.27
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Nov 2025 23:09:28 -0800 (PST)
Message-ID: <98445810-9894-4ce3-8c55-db3c18e2ae93@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 15:09:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Yushan Li <yushan.li@oss.qualcomm.com>
Subject: qcom: update ADSP firmware for x1e80100 and reorder qcs8300 entries
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eOONPKvm07BY30QJbKLB-K8z6oSoEdSh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA1NiBTYWx0ZWRfX8We7PfGl4M0e
 iNQWVay6vxfnopD3loKKRVdNsXsl2hjPUapxTT8jy2LCgE/9hqgq2YPvR5ONewN3CJDXKyeWN6d
 uBb47Tz4cJkf5p8C1dog0Lmj8v7eRa2+S9TpJz+ofk8HNS6wmzxbrQAIZnu7pvVCxANTOq7xJa2
 lrNFrlIqtkf41uC9ULeBb6Q1RFNsJ99dF2hx9ayb9LpoVtEiPhZkdPsNifWwu/ZStY4yM4dBtiA
 cZK27tBI7dTg2fgzo7O6wPna3sPHctMoLqHyIdohjHxRpqMIowp2zQAC8ulP9wJkVHQlyno2orC
 c6Z6SLVCHJMI7XWO9xy0FE4d1qqEP7QksU3ecKiCRnR2nkM6evc/UOIdd1dhb3UnXOcxU+j4Qqh
 HyoT5ANBSUV/QFs8P1lqlsZXQKfxLQ==
X-Authority-Analysis: v=2.4 cv=Urxu9uwB c=1 sm=1 tr=0 ts=692d3f29 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=QSPts3Ynr7ElwMbO60oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: eOONPKvm07BY30QJbKLB-K8z6oSoEdSh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010056

The following changes since commit 14d4b18b066788070c382a5ff7bfdce17ee3313e:

   Merge branch 'robot/pr-0-1764146897' into 'main' (2025-11-26 09:08:47 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
x1e80100-adsp-1126

for you to fetch changes up to ca24a0eb728f4f9414edcb1d628f674dfd2acdbf:

   qcom: update ADSP firmware for x1e80100 platform, change the license 
(2025-12-01 14:20:07 +0800)

----------------------------------------------------------------
Yushan Li (2):
       qcom: reorder ADSP, CDSP firmware entries for qcs8300 in WHENCE
       qcom: update ADSP firmware for x1e80100 platform, change the license

  WHENCE                     |  33 ++++++++++++++++-----------------
  qcom/x1e80100/adsp.mbn     | Bin 22235528 -> 22452664 bytes
  qcom/x1e80100/adsp_dtb.mbn | Bin 73528 -> 73528 bytes
  3 files changed, 16 insertions(+), 17 deletions(-)

