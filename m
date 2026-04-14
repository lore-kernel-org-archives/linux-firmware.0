Return-Path: <SRS0=Zs1W=CN=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CB8F531F3
	for <linux-firmware@archiver.kernel.org>; Tue, 14 Apr 2026 06:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 953FCC2BCB3; Tue, 14 Apr 2026 06:42:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AEE4AC19425
	for <linux-firmware@kernel.org>; Tue, 14 Apr 2026 06:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AEE4AC19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6fRHc2633410
	for <linux-firmware@kernel.org>; Tue, 14 Apr 2026 06:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IGT4PRIyl7hy0mlkgb6s8v
	8pEpGDuAvdO/GuMHBYSH4=; b=knAQbY/zKLXaChQqKWKqWyiS4EhkE+u/Y6mXbu
	B1C46CGnA63KS3UT6rpy2E4dcGeFa/hXEt2qIY9F3fAnGHFJQJBpfc+2vzWST+DQ
	17FQoDwL6gS5YvD48i1RL8rrBKNCRz8k9TWinMlzTkt+zuzzuF+iqQcm5sevE14z
	mcvxyrHHGt6LUT9kTJ3pJOk47Pp5+NHvP1qRcDVgawV7CnMGjnZ8b3KKFG9IFyVR
	l56MO3+3vu2abZiYd0E0DGAsSh09U/uswm4MOpnYxU7ZndEXrzu0nXZVSgoUPdKP
	Or6aDdUS/W6Ehl6POA08rhvP2n1iD3+EqoS3Fe3bz+wLblFg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86c9dec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 14 Apr 2026 06:42:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c769b25315eso6354353a12.2
        for <linux-firmware@kernel.org>; Mon, 13 Apr 2026 23:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776148939; x=1776753739; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGT4PRIyl7hy0mlkgb6s8v8pEpGDuAvdO/GuMHBYSH4=;
        b=HYd4Z9xkBseVSG9F/xWWgA9hV2pLvE25yF/9nH0c0/iMFvFgUDZtFkTNp7sOpLp404
         3OM8gP1De6W3CNArDUEkYjOrFVEAuC4PZ8njY8Hu9KSYQzsdWO7Dv96fof1GRNCR/sW+
         CRebo5omAo4duSSQO2wOzqAVSIadXN+YDGPakqUqNVxa+gi+suo97qQSvE09jo/iPHhs
         60JvcfBozN453CutoXeHnZwt3jugUUfp+kfNrVR9xhqneTHqzLshyZmmp6Go4BcapzDX
         1CNG61ipn85bQlsGgC3tWJaUIB2id63+jzqvrG60zuT5O3DD62eBUHd8UtdnNogk/rvk
         MHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776148939; x=1776753739;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGT4PRIyl7hy0mlkgb6s8v8pEpGDuAvdO/GuMHBYSH4=;
        b=oRX7V5AuN6b8WZIwm1iBbWGrufI7p53z06TmuffrT0eR08bD1qQYGECbTRULqMYjqo
         Xs+yLWPYJ3Qm9iOS0JtDygbronxoc7kIzgoEdknf4fPOOX1K8eH5kCWJI2DnIaf+2D6g
         ZVdrF5xOjdsRpDXtAjx33sHJ0Tu7vczj2lrPUPrv1oG0vsD7mHfeecLSWL7HR0ccAThO
         gLs1RP+KZVXv24kAFN7hIgDN6a/ajVvxIEx9Q7HK3ASeRmrksEHMQahoUzK91NwuJLAN
         934wNmiII2QgwRhBCtfNU53P0SB6ru7hJ+XIc1+e4grd6HJeSpyx4SSbGiHkpsQdv6MH
         fzWQ==
X-Gm-Message-State: AOJu0Yz0rDOyJ8Fbh+ivuJNcs4nN5bWsJWmVrlET1xOZByUO6KqjZmxi
	38+ibBO8wYdQL4JUNDEdtk/JnBslOlDHmQhSS9r/dL/zY5McPG9141JlS1LFB4N0lK2vPKxFvEM
	5s87MAk/HmCJLvyLWgzKRwhUwsvjty4v7Nv5pER6JwijF+ci7ZGsoc30N+yd+HhdbR3n3NAM=
X-Gm-Gg: AeBDiev9DrllE1KilKedhAMqWUd8ElqxQpfWvEs7XDAEGCrILZ4fEVzjDfAWIQPREkG
	Bo0/dr0nvXc25IKk1LFHiUdYFgICTWyyiO6bg5blALTc3JRHsVKTEDUueggWTd7Uf/Igl8wjVi1
	IKJ5rZHNBUfTDhU5uMGOGPHBihHmuPhs3MB7P07re5nyACmU+G2viL3hJHf9l4npg5N6Wu8uLEw
	kAcm7eixpkAFjLRmHI1S5lnEbhgDETpRUWuRdYUh1dALjufJRwAPkuY40AVWilK+KyN6N+oaTto
	ThWK40lAbSGDQ8qcb/zwR8UW972jfaqKzs0YliCr+5ForOBX8jvkfcuapzpzxJT8vsuoW2mOxmk
	9wjUwtuNEB/Qys12aq9d9I60j5C00NAfr0wtuP3o=
X-Received: by 2002:a05:6a20:1594:b0:39c:c3:4031 with SMTP id adf61e73a8af0-39fe3fe7db1mr18935152637.41.1776148938844;
        Mon, 13 Apr 2026 23:42:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:1594:b0:39c:c3:4031 with SMTP id adf61e73a8af0-39fe3fe7db1mr18935106637.41.1776148938269;
        Mon, 13 Apr 2026 23:42:18 -0700 (PDT)
Received: from [10.216.56.192] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79216ffa87sm10775168a12.5.2026.04.13.23.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 23:42:17 -0700 (PDT)
Message-ID: <f53aa2da-c1c3-498f-9ea6-22763592f429@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:12:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Saddam Patan <saddam.patan@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: Update ADSP firmware for qcm6490 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WHAN_1RvG_-P_oFP4job1uJLvi5QBiin
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69dde1cb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qC_FGOx9AAAA:8 a=t2EiY0NjqJe2eJBHB5wA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA2MSBTYWx0ZWRfX51BIBa3MKTSV
 v/mlmI52F+OBgsPH5bm/5fOdIA3zlRUSye2ccSQexKOQr9V2w3XNLITqnZyGxr+S5vPr+GNSneE
 s9QWCtqIVyLeqsI2LI47L6UbtSO1DmhLJ93OT4BK/zzPdU0MkrM2qXRj5ee+hbE8FqyInljKm9f
 Hhq7X0du/rWiDo75hM5uo2+AnwuRXYd2eVHU4Pj2n099QFrptpqG+owe6hcxdCvA/hcM2KGJuxT
 lI763MF1qJ/6EUMQPmual5h9wFmuaWH2QSCjG51ud3yYF72oNUeYXWCaHtUCc2jMzAZ1HBoJ4dG
 ba1UhJyTeGZXWjKRRQPpMrTDWDlkul2Nks7UAxGJJuvsxCXxLU0V4uAwRxDHGJEhHKED7CVE43K
 EoQOA349f0LmyVAWSVkxTqtLsIZ0OBDEyAxNoX4qDYmI/Q+WmylMP6Dr+8WsmVMB9VLw9u6/tzp
 Vbh0QRfD3oeAHnrEFzw==
X-Proofpoint-GUID: WHAN_1RvG_-P_oFP4job1uJLvi5QBiin
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140061

The following changes since commit fd6ca010d42dfeef4d510def2edafe907bfd1ee7:

   Merge branch 'amd-staging' into 'main' (2026-04-13 13:37:22 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qlidspfw-kodiak

for you to fetch changes up to 4bedb0e45e8256c1a0be900c981dc239b6820ed3:

   qcom: Update ADSP firmware for QCM6490 platform (2026-04-14 12:02:10 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update ADSP firmware for QCM6490 platform

  WHENCE                |   2 +-
  qcom/qcm6490/adsp.mbn | Bin 12095036 -> 12099132 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
