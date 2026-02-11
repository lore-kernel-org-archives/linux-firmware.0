Return-Path: <SRS0=SqhT=AP=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C2DECD6CD
	for <linux-firmware@archiver.kernel.org>; Wed, 11 Feb 2026 17:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 145DCC19425; Wed, 11 Feb 2026 17:50:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0FD44C4CEF7
	for <linux-firmware@kernel.org>; Wed, 11 Feb 2026 17:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0FD44C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BBP5Y31198404
	for <linux-firmware@kernel.org>; Wed, 11 Feb 2026 17:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YbEKtqACNKXR3HnZo2sx2b
	ZC79gvHeWfRD0XRdypxok=; b=cjqUI9apyQoddM8cKej2SKUvwO+LCrfEb4sppO
	RXk7PTK0uFBKBRgpoK5lTBjlurtFJpHqLwWXtkFMkoWiCbuYhEI2Rec+vsZ+ZbBB
	HShNKuKEoM++1JvJfYcZVixp97PrzpdaJyXHpW04OxBhQE2w5ifN5vwnKbM3lBP5
	HRysqNuLJhPAogGTS28Wr4EFsPtQUhv0M0j0KARUNP/iLBB0jjZprXrJmAkHE8BX
	1f06eIcCyhcDt9sn2jRuasCnNL1DUO1wp+iMJHO0D+M9iatbEUAWnY9PLRhggjSu
	oZsfu2kVHTINxX3wYTDP9jJDqvXn+Zk4IfKxKFUQycP+uCNA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8rvb9489-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 11 Feb 2026 17:50:18 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1270be4d176so20695856c88.1
        for <linux-firmware@kernel.org>; Wed, 11 Feb 2026 09:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770832217; x=1771437017; darn=kernel.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbEKtqACNKXR3HnZo2sx2bZC79gvHeWfRD0XRdypxok=;
        b=EIKydltQrG/N+PDU3mWjoBoRNw0iYMoj1Ds2isVumGse7HhQFAAvV5e7hMx3TGY1yu
         5SUuMKFfa14cVgVPFKLWAZmsbqEDYI/kuep2gefj1e42a+DXtd3qjtYzDLTXJF81XDGR
         CompZ/NARFkLq7VNouK4+on1jfaSHNYMhcLKzbMvkjfSpRyFCShJXvKGq552HMAin4v4
         9eDXutt4MjjKSRFlMf5HdVs85RFxDsudc8A/Kiil6fbs6cezmH96RCcg1JzPPObRTZIM
         FwXLM6aHupcVQvfdqHY2N0J7D0pmcQmyO9Nws+f7niRYdrrHbE429TxlU2IQVw4tBm27
         Df2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770832217; x=1771437017;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YbEKtqACNKXR3HnZo2sx2bZC79gvHeWfRD0XRdypxok=;
        b=IEpdcvAgP3FajL9V+DzeFqvKvakR8xNcojRVT8uJuzaYjIj63N0L+v/7NWK3EOA6pX
         0wxtnMA8l1zkuBscaRGzoQi9al/xITwzvFw99f/jJing4995HZzPDK6gzuDxPduR3zjW
         RAFIym9HEXvdOGjanmz4cuXmxyGFxt4mUMq0z8Rt3OKLymITpE44wMgeJa57gIfDv22X
         11m4MKRPYO2OXvEqtkBj/Kcv1LvqZVSaOTYF8EKzfBNWuGZAm8+VRCbglxUK+hbWqQ+5
         l+f65XfQ0Piu9+xWXaCfgGP0nZX6rwX9pPXPJhlGaBO+qkZWVEm6Dk32FEjvtq/727pc
         lGgg==
X-Gm-Message-State: AOJu0YxY3da0jJ0lmFyHtrP15CfDjD12b1k0JRtoQtWRcMu8xRDuItG4
	afPTTJVpnFOsIV1oZZZ2vPHcHmLBUbrrWkC9GF+0TwhT6E7mWQTRS5x6Jf6RcvF9475CLWbcE44
	T8iWdqjiPqod5CGe+F1vkFhmCVZhgwxfrjm6c3CuDrLfnvZTw3mwiJN+ACLMgPY+wMSIHvX8=
X-Gm-Gg: AZuq6aIJ9mMz+WSN0PodXXxmdQm/VnfCLOIuHNIbXUBIak4Y8LTpaJjDn1VsYoZuEqS
	9SuKX/vvMEltpyg3G4uqR3lAhXIDansGv0C/rGasw3Yvo1BPGC0pi/gPXjih5xa/q378/itaWRS
	IHIroFErhxBE8UqPxcfULi2UcJQpOYs6D/Ww04zyh9tkFR8o/R0nhjKRwAvD+9SWKGq+2ChGDmf
	3Q7hnO8nq9hwy1a10m+kGYPNuKhiX4LZ9E5JwWqamCNN8DoisxJHQ81EVkxurdIMPK+epSuMP3I
	JDSumyCw2hijLVLbOLX/xXQVX7m0cOhspYSgMZ2ipTOatJPrGwFzV/KrTdxJ52Zoom1zVsb5KAr
	FA4aNt6FFp88056S857brOm9QiEZiizMDj9ZYjLbNc8Ks2kOTYp+WunJgiA==
X-Received: by 2002:a05:7022:629a:b0:119:e569:f274 with SMTP id a92af1059eb24-1272f778d6bmr3979c88.29.1770832217500;
        Wed, 11 Feb 2026 09:50:17 -0800 (PST)
X-Received: by 2002:a05:7022:629a:b0:119:e569:f274 with SMTP id a92af1059eb24-1272f778d6bmr3963c88.29.1770832216903;
        Wed, 11 Feb 2026 09:50:16 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1272a636095sm2708226c88.0.2026.02.11.09.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 09:50:16 -0800 (PST)
Message-ID: <61ec2d75-38ec-4ee4-b447-3fbb723f59bc@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 09:50:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260211
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H+XWAuYi c=1 sm=1 tr=0 ts=698cc15a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=Y7CzE7BwRR1qakfplZkA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEzOCBTYWx0ZWRfX1gP7c+YwvZSc
 12BjItHvm3ZUn4AYuy7KJU0pYQLmN/m8CtGNoQjlt2ny1AZwj4WFyiTsF0b54DCZE1/7mdjeXBb
 Fwk+OpdxNMf5ghs9UR1nVOV9ZWF6Yc4gI9K/tUAqIUblgl4Aj5nMEMr0aYkRdAZgGvgaag9CI6Q
 JD2exJFCrgIMaWiPt5Ekl7TQ03bZ3FzoKnzjfwd4ghZhSQ9YQyeZsOPdBmiaWljoGgl/4tC6yyo
 G0EsMPXG7MFCAVY9Ta1UyI0UQGC7/LS1QS9scHmYUo6Vu3U3MfaRMtwRpcklMMOqrT7uiUINGY2
 H490PuuzecqyZHwQPzpQcprkSU+weD8nQqm4rjoIk00qvsMenIQhhYUeNA5GaO9riHJI+Iww9O+
 LLh+7Wt6B2Ec/kIb+igZV7vXCTOB/ZYT9Jg17uRBMo0AT2CbDqDLKeqlZ9gL2YXxUeafNbyyMlb
 jNU/cct/t+PYt6EjXiw==
X-Proofpoint-GUID: Xy6b9OpioDFSo1AIx_61zO8ooUxhQJR4
X-Proofpoint-ORIG-GUID: Xy6b9OpioDFSo1AIx_61zO8ooUxhQJR4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110138

The following changes since commit d87f4693ed96d0f3f6f16b0f09be42f3b8acb9e0:

  Merge branch 'robot/pr-0-1770665774' into 'main' (2026-02-09 20:06:30 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260211

for you to fetch changes up to cbd0f9753754fd9605df129ff04b0c4b4fc82568:

  ath11k: WCN6855 hw2.0: update board-2.bin (2026-02-11 09:33:04 -0800)

----------------------------------------------------------------
Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

No updates for ath10k or ath12k

For ath11k:

Update board file for QCA6390 hw2.0 to support:
bus=pci,qmi-chip-id=0,qmi-board-id=255,variant=Xiaomi_Pad_5Pro_5G

Update board file for WCN6855 hw2.0/hw2.1 to support:
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255,variant=HW_GK3
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=18,qmi-board-id=255,variant=NTM_TW220

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------
Jeff Johnson (2):
      ath11k: QCA6390 hw2.0: update board-2.bin
      ath11k: WCN6855 hw2.0: update board-2.bin

 ath11k/QCA6390/hw2.0/board-2.bin | Bin 173980 -> 231980 bytes
 ath11k/WCN6855/hw2.0/board-2.bin | Bin 7117076 -> 7237392 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)
