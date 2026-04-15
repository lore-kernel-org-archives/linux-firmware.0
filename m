Return-Path: <SRS0=6Q8t=CO=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82688FA0C29
	for <linux-firmware@archiver.kernel.org>; Wed, 15 Apr 2026 05:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F76FC2BCB0; Wed, 15 Apr 2026 05:11:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D02A7C19424
	for <linux-firmware@kernel.org>; Wed, 15 Apr 2026 05:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D02A7C19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F2YWd42005540
	for <linux-firmware@kernel.org>; Wed, 15 Apr 2026 05:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lFM/1dXlolkNKCA7bmfDWn
	FAWfujuTD/C4eD1+FIyMc=; b=dS2HzXA1K0cIXy3PbCyEfn/s9TqmjKrYHLwZid
	SZEQx1f09c+19riGUXPoyZ+AWGgIPIauTTXElEd1BtRuNyTEeSbeIbAsSVNFRZtg
	yO+PAYuNLXvWQZatfDP5MAzew4b/cv0yz9XsJAkC/mDZPI+48+VIou9zxQ8VASSE
	S1ZnSCMmsySJgY5YaP7SUrO6dTLZkxZkP1uqMCmSPxNCwdtLrDIM+txo7zlqPtgj
	l2lEm54fo9pSkXGW+itfZ0l4y9CqfOFuQUyD/aZxEpyQ7ineUSraY9S+j5iAIHew
	BmTqQN1n2y/zyJyignWaL+sVsYcmovYGi+KUjFBAA3klNvBw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrsjt78q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 15 Apr 2026 05:11:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76b6ccf298so3871533a12.0
        for <linux-firmware@kernel.org>; Tue, 14 Apr 2026 22:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776229897; x=1776834697; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFM/1dXlolkNKCA7bmfDWnFAWfujuTD/C4eD1+FIyMc=;
        b=GxmfJkjzcbGwWPyVR6/pBL3cRKGW/bt5Y2ZnVjVxWAp0gwJAP5A+WNCCOAJaqCT2En
         tSG8A87p7tiVk8blD+YodLQsw7Zx7bJbNexSUMtuqoBsDxR+k5nyNsXKE3YEqvyrwvRC
         ivL+owfy3GhaOS+2OCF/dT+xLdX84fLysGbUIk4l5xfTzetwn9YsS6jjq8kAMa6cRioG
         0QQA0gUfCLtylr/Jca7MA1ISs5wE9s5QQzgnQZnCi7VyIoBNrv5rmtxOAU/+UTdnxYdJ
         fGnQZ0hRQzlOyeNbZBYPwfnJph2CfunmKqWIWpGlqBmqqJQU1HeYP38NveFFdkrLb6TS
         aa2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776229897; x=1776834697;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFM/1dXlolkNKCA7bmfDWnFAWfujuTD/C4eD1+FIyMc=;
        b=soUObwM/lzawP5rbxDnvvsN7fiznlOJDHUAk7rrUjWjv27rLMityZ8i79/455ETG7T
         mgyzcqLQuAl/krHPj0KFfPXg3tjoXBwwo9Fs6kn7AwcnBBNxkdtiXLHpP5zDml7NtjSL
         5Oy+T1lIubwBO8dPWuLLEfwttrgG8f6WUAgnBUs8vvcpWLEQ5Z//QytyqbOCJ/mP4NC3
         DOEZiupIQ0XIiUjldEoCY3TV4cxRgtPII0qRcqtCc7dHkXaNdKKRgB7Io+h0XcNIlo52
         zJYJcwpCwNLJJKMc3D8U2X2d9PO0dokVaKeWu5FlXsfw3qdUW4wzjxODz9QiMFxQ/lzy
         qQOw==
X-Gm-Message-State: AOJu0YwdHFKpYXrSkBBn37XhICgFUlNemQqt6JCFEQGNUZfMf8WlN+mx
	M2vwBaaYyz8+aqBHRbCAp8NgSXd/Mh74ins7nklYfGIr0NlDzqpm3RtRgDWFCqACcAvnX8HP+9y
	/LPVgPKl5hyphoktPmkRTLx1VsLbBUbd7y/fXMwfkX0XDN9Zfs3TFFlN8jknFdbALhyrsFmQ=
X-Gm-Gg: AeBDieudhxQopNsC/wDzamBbH26cltX1rXc/TKLc5nDFPG4mCboog0hUmnIdt+7yFHB
	7QJAn5KkNSb8pIZIHVERRKIXb8+AHL+CyB9QvRjf0KWumEEWmCm4awortf1g5XOQKlOONTH2Q3O
	SjV6UOkBMFsfJEsh6TdLhF2lo5gPsDqxCkpkPnS86K7+wfU/0FHpPGps3vqRHkFQhMicBcyCBJl
	WLiU7fjc8Cn5CA1yFGaJu4+CqC/xDaGusSZJm1KaJvO/iuSAp1NTH6UDkrAmXm3TMWxTL9X71bm
	Cx25bgaNTExD+CbymdXtyMHU1w9Ptdi4WO8fLgUbXnsoLPvriyeL6HRXOAz8p7Lo5vwDGFrn9Cb
	lbQRC/Ha+K6PskPaq45g6hMckk+yg4h6xc6QbxiBi8uhuGXGvDZQ=
X-Received: by 2002:a05:6a20:3d95:b0:39b:fbb2:5e31 with SMTP id adf61e73a8af0-39fe3fe7e69mr21430057637.43.1776229897121;
        Tue, 14 Apr 2026 22:11:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d95:b0:39b:fbb2:5e31 with SMTP id adf61e73a8af0-39fe3fe7e69mr21430033637.43.1776229896588;
        Tue, 14 Apr 2026 22:11:36 -0700 (PDT)
Received: from [10.216.56.192] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7957ece99asm493521a12.4.2026.04.14.22.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 22:11:36 -0700 (PDT)
Message-ID: <b841105b-a766-41c4-b50f-392a06fe73af@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 10:41:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Saddam Patan <saddam.patan@oss.qualcomm.com>, kssb@qti.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update ADSP firmware for Kaanapali platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WKhPmHsR c=1 sm=1 tr=0 ts=69df1e0a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qC_FGOx9AAAA:8 a=knNiD1FvGzTr8qkDlTEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: sdx0SrurEKfpxHtFBlrbtvpWliMcJLfT
X-Proofpoint-GUID: sdx0SrurEKfpxHtFBlrbtvpWliMcJLfT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA0NSBTYWx0ZWRfX1EHapMvt+U5o
 qrRS2m4G7QfdviYlFtehyZr1O6PbJPf10kY0ZyTuNmPFQ7dbRPPcMvxNY+ki+N5i0rJ5lNkFq8J
 nAez6tRh78AhkFAwmjUZlBx3sHQhwgYC84D8maYWVDgcDigJPKATs7TFwKxwKdsUMFd1frqy6JL
 SN4xlukhEzyIymav95nJEU6ug8u2r42ZVgTUfMQVIF1DF5J4lELEqSrs/mlZpf5/3GUflY66tSM
 0nEUkhG/03NHCL5wgFnapdYlX8K0zKsE7Ta4wKhc9ngXJzGCf7WcIRyzsC3YnzCIEJX63DJZ3e1
 peY9W5S9jJPv6GUyivlq2hHslCnoH60RCVUttDJl9hnIrcs/B883IFLxnsI+YPqRbLE8kxlkfeQ
 IYC0RXthhWeWtWvjY7hW3yKrXRZEtFO3gU5kaL0zVNjpfqWMEF53H0RD6P749LL9BrPQrdmJ109
 AKXFNRaJizuaKQLXtgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150045

The following changes since commit f48f551a902b3cc6e6aa8854e533902d3222a0c9:

   Merge branch 'robot/pr-0-1776148994' into 'main' (2026-04-14 13:01:44 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-kaanapali

for you to fetch changes up to 052fec7e57523a594ac518a071c854bf5c6070d8:

   qcom: Update ADSP firmware for Kaanapali platform (2026-04-15 
10:38:33 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update ADSP firmware for Kaanapali platform

  WHENCE                      |   2 +-
  qcom/kaanapali/adsp.mbn     | Bin 20703432 -> 8311880 bytes
  qcom/kaanapali/adsp_dtb.mbn | Bin 188216 -> 175928 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)

