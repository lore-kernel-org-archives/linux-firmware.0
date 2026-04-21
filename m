Return-Path: <SRS0=D1D3=CU=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91196F327A3
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Apr 2026 05:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D62DC2BCB6; Tue, 21 Apr 2026 05:57:47 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82847C2BCB0
	for <linux-firmware@kernel.org>; Tue, 21 Apr 2026 05:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 82847C2BCB0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L1IKBi2281735
	for <linux-firmware@kernel.org>; Tue, 21 Apr 2026 05:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HAllytj52E6zI/tbUr6Xnf
	C2AICkFpVIcQXfYR4eQy4=; b=QhBAX3sIrjsYN8ebjdMg7qw2EFh86EmvPtiTgB
	wETIN+JoYlxD5e9FgfU3siHz2evOleCuwgvF5Z7O6Y+xxTEnt5Y359puGXlejYGF
	fGRdwF2I2OV3LUge6h+o0iKis24Iu9NJmjFAbIJIbOHdJHQToJiybPmPmsIIfz1X
	mokMO+iNnrfz9JnF7YVr0amiJwSGDlBax/SS4JBzh5GuyKbUnCcco3Dxombj5B93
	ok3Upy/bmu+isnPXNFXk2HhLy1sOkXdESrlGfWtm4HOaKCfbxhTnvBVGvHN0Jyc5
	vQQmvoo4NfNOI6yxEq9PsF7QQu/w3FFYhG7O8f7cUk1CJjMQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh59c17q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 21 Apr 2026 05:57:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c792e2169adso1472097a12.2
        for <linux-firmware@kernel.org>; Mon, 20 Apr 2026 22:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776751064; x=1777355864; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAllytj52E6zI/tbUr6XnfC2AICkFpVIcQXfYR4eQy4=;
        b=HjAL4Cm50LfQfDj3kU3Xd0ks1yqT2WCXntvykG2MYixcD7TX7mOpPfs0qoV4RjXRJm
         67Q1HA8XzaptU88BKFN8hM+md7a6XFGRn29tOLDkNfIbP64HRyFGd3bXILmvg6pTroB0
         92y7l0nqij1SqslCQq6jWz7EefhRTbMFGEOM9qN0xUf4seYA1zxNbjV5dnIRW2gQOv1l
         fIsYzRWhLntf5RY2e3/YS3h1QAyaQpopynkzXIRnz/Om/ZSN94L5xK6SRMTLHROZxE04
         SxsZfxtollGZ0vvPdQpDzcWnyoSxbwJWi9my99binqonK6309jLcLjolLh8Nk6uSaP2P
         /RRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776751064; x=1777355864;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HAllytj52E6zI/tbUr6XnfC2AICkFpVIcQXfYR4eQy4=;
        b=jmAJPoRuG3tW/XDcAMoiSNV3mp2VYmsMZz48xxWpYBStIawidD8nBHAAhT/Ywo0vDa
         YwSH75BhpImChn0d4P6YXSKvZ0CpaFK22cnMXAXrf6GARlXLHbLaWqQ7a++b0/eNOsV3
         LHGPT49xH8bzCFcpTGgJVjA90Vtmh6wCp9jjJAmTEYeUPUitRMdNbz6v4FIes4YSnPlj
         Y0aVdg7VlE+IvhA8NvZrP8gavZDlcAB0NM28IgBMgyWhSEcJlCrkarh872BMkUE2CwaG
         BUP7ZwKTaN2UiAug/aOFQfwHOuTWxrpOHRumCis14YXoKBbpxs5D5bPftRNBCbpeGPy/
         v6ig==
X-Gm-Message-State: AOJu0YwwdVvzdDX5SYWWiAs2IewM+mSz+NHo1UXYK/TsMk+WyBHyhNq+
	bcv0vrj88Kbj2V4OQqfNRnOi/wjvCG4X+PiyZZrTL6f+tOgVNTjxxMIjD/UlQBo8FHU+cjHL7nR
	whbaNImKxJ/qoiSwui02BbYVAyaSbHhFdljwWvQNlSnFseRTQIRWluP/0rOZx4Hk9Z/4n2ig=
X-Gm-Gg: AeBDiesZZMYIgLCqdBWVC05WfhA8zq3EM+18bCXcESQyDaFCXgmdpwyo3lQNB2UrnCC
	5Zd6xGV2UgUZo0YZuf+DiWSfSKprkOqDJATaXgfbkYwL7ZxFwKT/JP98OGB48lr/6Jfd+dy3/ER
	6P+7exUpZUPnyTS+FruHpQWU33lqdr+JzabuwxgZhi6GDp7BzwwYew5pGXZfpQ1WuZiDEbjfi7z
	zpgYT0vioR0H48kP8rbW/MZwC4viGQ7FxGhynwGmvorSwLeYAs1S0B9LG8E6c24PFFGLV2Zx3Mb
	8wFyegCUEpPhxp2a5vqdkjV6CUA59WSuEXZExT51Wdtz5IWa5ZmVW9a7Hw5SRxb/MfRseG1PFcp
	3Epq58DpGMyB8Uq45Mc+B1zo9n4Az+dw3AgVwrCBoRU6zjwX9Mg==
X-Received: by 2002:a17:903:2b90:b0:2b2:5258:a23d with SMTP id d9443c01a7336-2b5f9ed1458mr110337515ad.14.1776751064297;
        Mon, 20 Apr 2026 22:57:44 -0700 (PDT)
X-Received: by 2002:a17:903:2b90:b0:2b2:5258:a23d with SMTP id d9443c01a7336-2b5f9ed1458mr110337265ad.14.1776751063694;
        Mon, 20 Apr 2026 22:57:43 -0700 (PDT)
Received: from [10.216.23.234] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa33486sm147823995ad.33.2026.04.20.22.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 22:57:43 -0700 (PDT)
Message-ID: <ad4c27c0-7ce6-4141-b452-cdc87ad72ab6@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 11:27:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Saddam Patan <saddam.patan@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update ADSP firmware for Kaanapali platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0e65EZyP0yNHFNgrw3bTe3kV1PJZ6hoR
X-Proofpoint-GUID: 0e65EZyP0yNHFNgrw3bTe3kV1PJZ6hoR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA1NiBTYWx0ZWRfXy/J0rqaq6wmP
 KEAhD6npgmfIM/Q5YsjpT275xU/Hwc3ndU5AQGohIEPcuUit2EqkuWHYjw2JOWluJn0dzccd4w0
 GLGN7P6lihSdv3C6Q60NUkXsa77lKIZcQmzII6nnAo+MPHJzaNY0APAjFOOV85GLNb+gBmn08dR
 8FAiz8lrNEhUmDQOTurgmvPlDZx7RoUyeZtcRB8UbnCI84MFqNrSKHiB+iQPYiicw/PQpVLqtHq
 AAhC0RIic2uhdhW9l5vLlVfEnMfGo+znAGfbFM1T+Ju9tDIWXhjRIO4RtW0xao95XlZNN8SUuW2
 9ZVC6sPffsvoUBAfJLdZU2CB2alJRkoG6gY7lxUo2TzPd7MVFNEfcbis6MqbJFUyXZNJsdHbe13
 rH+kMGacJEDFTTu6ElL0FHVjGHtODwqurzGSwb4b2FyOyOJHG7+bqBLOpbe1tosDFhpyRrahUly
 F/AQxPvD1LQ56GoTAAQ==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e711d9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qC_FGOx9AAAA:8 a=SdkRTHixgpxaJyZDGqIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210056

The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:

   Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-kaanapali

for you to fetch changes up to 80e641ead77ab8b183bf30e45d5023579372050b:

   qcom: Update ADSP firmware for Kaanapali platform (2026-04-21 
11:23:19 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update ADSP firmware for Kaanapali platform

  WHENCE                      |   2 +-
  qcom/kaanapali/adsp.mbn     | Bin 8311880 -> 8311880 bytes
  qcom/kaanapali/adsp_dtb.mbn | Bin 175928 -> 175928 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
