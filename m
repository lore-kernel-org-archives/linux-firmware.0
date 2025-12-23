Return-Path: <SRS0=OIGz=65=oss.qualcomm.com=renjiang.han@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8C0E6F077
	for <linux-firmware@archiver.kernel.org>; Tue, 23 Dec 2025 09:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0DE6CC16AAE; Tue, 23 Dec 2025 09:31:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F561C113D0
	for <linux-firmware@kernel.org>; Tue, 23 Dec 2025 09:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F561C113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2TlaW1568865
	for <linux-firmware@kernel.org>; Tue, 23 Dec 2025 09:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZDqZGPM00I1S1I41azQzcs
	YsxNFkax3jrfFi7vRVpx4=; b=oTXC8TeAJyUq7xLqmLPoxXv8IHsVtTyKZ55Kor
	cxriq8AGP4VS9BwWjd0uW238DU00ZrPQhF5ZLKhmC2VmMFfels4sRhZ+vY9dZbo+
	XzfB/IR7gNvlQCMo1aZJfvpgbacO0owNNUs7wb3LAPOCHHKsSgrtFuCq7qHsOMa0
	pTScvzMh9+9ylF2qKbFU10SjJsD8o0ndQYrmPyc5TPjszb5NbhwhZOQTxjoUNg/u
	pF1EqVnA40db9mfnpfVnU15TxmGuUoPe5oPVAQFHtlk+fF7ujzKmPR2emlmWadtN
	53fZy7/Jbfxo7xYFgBPiYVNjiSw7LVSg5THjuYRc2ooaqB2w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b76yy33yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 23 Dec 2025 09:31:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7d24bbb9278so9549972b3a.0
        for <linux-firmware@kernel.org>; Tue, 23 Dec 2025 01:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766482311; x=1767087111; darn=kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDqZGPM00I1S1I41azQzcsYsxNFkax3jrfFi7vRVpx4=;
        b=J6yRsX1CRjOEIiUrwRFKyTo6EUSnuXidCjEHRgQSwOrhmX4gJrocqUjzGHs41MtiTm
         qT9QvYQyldhq9bxrl60/NdSNohaMXFeqDe+EEldOnb3GMGpH4cfPolKR26g9JfEAcdcj
         1yvjeee3wa2eUc5ApzVg2McpTyI8hL9bnEmmoO44GqRQnfpnVeYGBnXMnrhvT/K4V+Tx
         oqMQMWJWXdqsNMzgbP0kF23kqfgCE/bMeqhPwkgoBsU7YJ6keN1sw77bGi0HzVy9s2Na
         Xtpsg1AVqGZtAIjwbEv+E6fCJR7gePQKmpSHHQ3EtfDHwh88nSZ8g/6If9rSrCTd+qB8
         yMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766482311; x=1767087111;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZDqZGPM00I1S1I41azQzcsYsxNFkax3jrfFi7vRVpx4=;
        b=ttn+M4ItP05Qx/y+cvfdklnM8ie9ROKWv6R0QwuJyW/qQ7tdXkb/iAy4CPgvoUv1Kf
         Cdv9lz46hvBAy+8gwOA4vvPrp0VRYzR3AbfQIxlXc2eNr3CRnhjHpK4+VBDaxMxtFnXF
         ubBfEYwQDr1Lab4CA9muB25GAy0dwmKSpbkzus0MKnra6Ts8H+Fh7gTwLYT9f+69A9sx
         BzPiRPlkl7RlwtCE7cy9n88tA72FOwcOUy1uTVHwJhEpOJJCzj8CwiQ9/swc5pkvi2gQ
         cdiNZwue5xnf7aZ04YZC83O4moIKjNjO+22bPoQzI3N710ph5hoTIHBbjuXGjOCBYVKT
         IW1w==
X-Gm-Message-State: AOJu0Yz9sZj3lRIo3trQNHrs5T1YDVaU4EvKsnwPCxDksuVU1E3OzJTC
	JnCqI0CChdWcL10MUoyqWFPdfI/TPteMy6l1qpOGzXTCxn2RRrt2Crp/LQXwchS35k5KLXPD/n/
	pvsLPh5LHI9vvD5hwpuEMgrv3FPU0FFaotCvjR2+mk7NwVEoK9EdefZ5wp2T2GN56ecX22Kr+ZA
	==
X-Gm-Gg: AY/fxX5aZoT3pPdoRVpZwUqq+feyw/d2SYaY7CGDN65FLdRLqcYXRqDTRt+1HIfS31z
	bZZ6a3mj0J/srHnXZAP61jMrUjqXMVcd3HSKWRiQRH4FvP3BAUrxxkmwRhqk+PTLmNt9i9bDEv4
	NMpPzT/vvAU5FSPABHKO8ncDywIuFZ5pu08LTkDOskAZgV5jjj+n0Z+3wks6iGxWKTy/zwXJ7JP
	bft7X3/xxBn1sKvt3hj/bM1KtAJeSdrqoy+edBYENxUhmvPs8fnVSjQFCXloE3X3SwByQs04xI4
	OxSXyHuia9z06NZHY0OvAZbV1zYR9vX5ZPJKSYH6R0Lti+NwlpkgOpnD60xLMq0ePN/IICH67/n
	sCGnq6bDNZ3q1OeB/XfXMmIWoRdY7+FApoLZpO0wCo49/EgxI6qsY1wvrcRwZ1r29LRr2LWH2Dc
	iPQEzrxg==
X-Received: by 2002:a05:6a00:328a:b0:7f7:27dd:7b1c with SMTP id d2e1a72fcca58-7ff657a3052mr11637845b3a.15.1766482310598;
        Tue, 23 Dec 2025 01:31:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCxiht0iaZNPz4c7KSnWXV0W6ajoWXgs7wMk3ebiYdxhP/WXtdNVeSMUh4bibZQrhaNWlf+Q==
X-Received: by 2002:a05:6a00:328a:b0:7f7:27dd:7b1c with SMTP id d2e1a72fcca58-7ff657a3052mr11637830b3a.15.1766482310152;
        Tue, 23 Dec 2025 01:31:50 -0800 (PST)
Received: from [10.133.33.197] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7ae354easm13083344b3a.16.2025.12.23.01.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 01:31:49 -0800 (PST)
Message-ID: <339b060a-6dee-41f7-8053-dceb48e5adfa@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 17:31:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Subject: qcom: venus-5.4: fix ELF segment alignment to 4 bytes
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NSBTYWx0ZWRfX5Fi6no4PRV0q
 B+irUowBl4vv81+ouRNEKq6kQS0sEJgohz5PI0Fuse4v10ymN+ejcqILpz+QnGeKS52IsYIuxxT
 SHUJJx7g2cBFMzwlz++EujQw3XO0N6eRGAJwmpuZQo5gr3S1vU+aCYrd3ldKpODMgowxxNPWz0K
 EhfsEW4Rv+f/oYnnj6c+QNzj9xF7iQ8WRKQgtFI9gytLK7grR/vEBjQv2pcp6ZX1nEX4qrYRyKa
 UhMcMZcNKjgU5jDe3UQhcQ2D1WduNZ69v79062QB2QSCe+j66ieKonVYeUUGbFE7sYWP9K8+7cC
 +rkHH3deR+vePEn2TFwGxzxredMep3pmtKVaqWndgz3XW9siJ6C7HJmgC731/tuMvJ8dKWEayrs
 BS1CPzWs/O1uA6ZbaS9i2C0auv/VH9wdxj6v8NbDFA6txjcHiXy3QH0dk/zIxBD1fpY41tzJpE1
 V4bwSPxwmr9YJ4PW66g==
X-Authority-Analysis: v=2.4 cv=Zb0Q98VA c=1 sm=1 tr=0 ts=694a6187 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=rzNtKf8gdQ6xmzKz14UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: O_mCPO-y_aKcweIcMRVYvw5WMCoQL4rK
X-Proofpoint-GUID: O_mCPO-y_aKcweIcMRVYvw5WMCoQL4rK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230075

Hi

The following changes since commit 881c549a82203abd9a88870ba27f3e8ce754b2c4:

   Merge branch 'mt7925' into 'main' (2025-12-18 16:26:39 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
video-fw-v5.4-update

for you to fetch changes up to 19b55776b5b5102afd4f9b99f62492315b52fcd8:

   qcom: venus-5.4: fix ELF segment alignment to 4 bytes (2025-12-23 
14:56:54 +0530)

----------------------------------------------------------------
Renjiang Han (1):
       qcom: venus-5.4: fix ELF segment alignment to 4 bytes

  WHENCE                   |   2 +-
  qcom/venus-5.4/venus.mbn | Bin 922312 -> 922312 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)

-- 
Best regards,
Renjiang Han

