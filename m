Return-Path: <SRS0=Ux9Y=GU=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1A5C61DC2
	for <linux-firmware@archiver.kernel.org>; Thu, 27 Aug 2026 06:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0467B1F00A3A; Thu, 27 Aug 2026 06:54:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787813654;
	b=sd+jDejl5KVIRftiyM/gptE/ADLFG8L5V294fVH8dEa95MyXqF7Au9v4NXQhxWcFeY7z
	 h/CtzwUsigyWf8l9Hky4ci51gnZw40b1Q5dYZHSrNurEMnStZYswo+DoKkKs6nciUJ7dQ
	 sYxgF6zKwwLFTrE2ZIyytWVe+cnWQx2PE0gX0W9srfGCa32BynQDpS76sDvKoRf5GzEY8
	 c/bKsXBoqmKOUGBoJ+wM/j4bkNmQrxg0387vEuUyaeSZJZPE4N6gMa+hNXP8n9URn5Ana
	 EBMp8oaU8iswm0q/ihqErFRTTj0Dj3ZGLuIchQaNIUqS1EI7CmwPDH7qO8POwuqRggg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787813654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4uQHTda04nN+X8QnTy+u/78AHX5HAOQuLxMchy52eDs=;
	b=FLs3284yaA8Aq8pJpzvVKuCDrEqdcH6FTD7UnzeCz/1qVNyDuaUTY/wUR443CRdPTuWW
	 tI0X12Wxq4KQGky6tqabVFaC4CiX1lxRbz2jYXvnnh8T2x4bFcUIJm+Fl3xmj3/AQB2LB
	 XLas9gMMVZgAuZAxb3ZDxrdQcg1Y6SX24IbLM2EoqMTbT23ge9g9G3WSA6tuJ2C2bW4yp
	 aWzTNqxxsqYDxUmehhLSW7dLwGze8D30eHgL1yDv+WIVqQlhWco2BdrJGd1/l7rK5oJr2
	 Ys0fBtqO+zrW7xcK+9SCTHxU6Goyd0uU+jLSKfOkEzMaTK6fQ7RlGcggxjAii3Pmk6g==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=grN8+67u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PdUaYx8O;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A89F1F000E9
	for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 06:54:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=grN8+67u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PdUaYx8O
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 4A89F1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6RVKq3592915
	for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 06:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4uQHTda04nN+X8QnTy+u/7
	8AHX5HAOQuLxMchy52eDs=; b=grN8+67u4ktLDyo5TpjYp8O5k/32HUhJo1ntPw
	+mh9Oud0hNVRVSQnt+c4CHxxWlLcbCOPvmNRt/6uxi0uLQHWd9tLyL8y/I+rFV3O
	LBKtUkAyx46BgjHa60G45Gkl/yFeteVAmZJJtv+21QFJmuZzNV9aDinuWSNSbf5t
	OmUpieutnmgnlQ1jpZqA84Si1fjA+ockzyi8SFYWp3rTmFVDxse+bfZUpzVQ09GM
	sWu38XBOej4u/Xan3rFLlYhEV8tzTYEDl4Napb/sctbf1wUZ7xzUTjBX8fbfK/zG
	sHQ2DalKR6DeR0WvFftZaRxKHYFy0x0OLHPMbLlrpBaEbiSg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4egjf8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 06:54:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84a67b16217so2994182b3a.3
        for <linux-firmware@kernel.org>; Wed, 26 Aug 2026 23:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787813652; x=1788418452; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4uQHTda04nN+X8QnTy+u/78AHX5HAOQuLxMchy52eDs=;
        b=PdUaYx8OwAxUnIWDV3VpOgu4rKvSmcmZ9kQC2nLhevhzLDT3h7BXEGm+/wylShH0/b
         Os0UWU8qVXYiy1ralxv2wnZEC/rujKxgNvnsD6FjQI/pEmcH9iOK8/o/uXFhQiJQKYaH
         kT52Mh2ndxXQY9f1BrEGMT3HWhGfZyxRaG3khu1/VqQ5xwrd/rGcJQqGLYPDGZF5v4ez
         1KFUmzVWuD1tOqQHyES8QBu+J1v3tXbHN9jP75Q2koHSAjy1DggPVmT+5aDNMB1Vk1et
         2N4DmrGwWY08HtknP0qDb+m4++rKyIezh8fMjDLYYjfl1aquDcT74YzXoT5E3A43/IES
         ehfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787813652; x=1788418452;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4uQHTda04nN+X8QnTy+u/78AHX5HAOQuLxMchy52eDs=;
        b=aSa8qFclnArUp2N0aBtGzrnASVxsdGgvR84/fzsQ1N0tCrB9JQVcSli96lay1F+K3M
         Vd9NL6kHL2QANJ5BjBAAYndlgwjBzRBPe9RAMajbtgGWC37kYhpGP0bgEDeiciu9wbFt
         uv4B1COVVK4kg82XEjIAdkHX36Ra2AzkLVVQNNvzZ4NRzeRv3LhH3jeTrnBo3/sL/3vB
         Jk+6KO4XB/9dMxHE1eV2WBmY3+wkW+FIxjibpnAcnYQbNZAZE+k5d1Zsb1d99jD51g+4
         hkJU5KE+nHAhLH2AjfYMIPW9k4HnsJ16qwTdf6TCX1MKhRw6cRXN+CQj0HN/cGwnF8yi
         SKLg==
X-Gm-Message-State: AFuF++kMyctm1gybT0jbijEMUdNSK8QuEC4pzfIhCji3o6/1/dpE/ARW
	tEc/ELtAKJjyXkWIadYZwtcHREw7AdqMoVqfoWMJBDlEnoINKjBh5sOHpc6om/DvTFpKSYdnoOo
	ljgRG1uoXv2pwsclYIqiR0oP5uXc8q8SKEPeTxPb3EcZMHo9QtMIUZ4ScK4N1Dnq5PcIUcao=
X-Gm-Gg: AR+sD12B/Wfk28yIn8OjoIDeozxLuuXWh+AanMCIO09aO5WIp0MMFz/UvMKbzQY6J/Z
	kQCWuj3zphMaoVUSeEi18m6OAGWAMyN156mW5ur4GzEb4py+80ZlkbGNicoaYlU7HNG3Fb7KMWz
	H1FWzK9IaETkWzcwdRsvydOUHc+Mn2lhfB9kdPnDbbTgO79Ri9oJLQziFrUfX+GZ3VNisuTUI1h
	7X5EHLpU5DWoc/lbZsgRI00QQiNDPytlKjHOkNoHaBUnUcqmlcJx6qtXJAPlsX8VuY1FQtSneAh
	gQGPQIBbM5gkd+HBSZgj2nnp9IAJjWDw28pOMpnLVkZ7JhEth5jq5CpJXpo5HHNBd3U+uCzDdWM
	mvHGELqjefbhrBi+tocvgPKPN2bxJgZs=
X-Received: by 2002:a05:6a00:bd03:b0:847:77e9:acbb with SMTP id d2e1a72fcca58-85374ab4b70mr22494267b3a.13.1787813652129;
        Wed, 26 Aug 2026 23:54:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd03:b0:847:77e9:acbb with SMTP id d2e1a72fcca58-85374ab4b70mr22494212b3a.13.1787813651686;
        Wed, 26 Aug 2026 23:54:11 -0700 (PDT)
Received: from [192.168.1.7] ([106.222.235.228])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1bec62076sm1804301a12.18.2026.08.26.23.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 23:54:11 -0700 (PDT)
Message-ID: <f9a167d2-a893-4b54-9030-dc013df765cf@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 12:24:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: add HPASS firmware for nord platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ddTL_Kdj6Iymn30ggtmF-9hwgNLN_Y6U
X-Proofpoint-ORIG-GUID: ddTL_Kdj6Iymn30ggtmF-9hwgNLN_Y6U
X-Authority-Analysis: v=2.4 cv=DsRmPm/+ c=1 sm=1 tr=0 ts=6a8fdf15 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ib5qGW2v6ZJfmEumhZfQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qC_FGOx9AAAA:8 a=guVsyQwZZ7q_wI9rv0QA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA1NSBTYWx0ZWRfX30+uhQhu6YON
 RG2V0BNlnoROq6aj4u81xIhkjzHpejSO3jl7zYD2Cu69lfQyS8N5oGEOcFB8tTWfEay23JSdt84
 uH02kqWfUeSD+gfgXQk+DcpLph4ecxXdDd9bI+glLPG+S6rD2ATQ4kguQ3kBOdOJLTb5edvuvKN
 a79IxMfg0CT709d40JvTUs+SFYOFLC/3OfE9CcATl6yto7FfyW/FL1LZhfv7u8tt23FRyxqcqwG
 Xvzc0I/eJTOqBM0wyepP6RKavBNtd+9cHEwe88CiIv/tcqbaJWlK/f46MlBvJR2cGpWE6lM/17F
 m9tnmQxLxsKkx09pq2VwJt42H8KbSMZFgWVd8sZhjCWIqNdtAijEWg4nkgwtYt77yPmE8IryCsX
 xASZDOdsrNm4N+oK4hf2HO79zEthmk0asD1wb0hH/8qiL4a7fSumsYi/a/JZnttvwvoF+BZTHYF
 yA6OBjVTl56fzon6+lw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA1NSBTYWx0ZWRfX/NNtk18oyV4c
 Ipty9uSmV4BTYZXu5BfAl/xQTDVFTA7r63Rv5mC+UXOBXzekkTBGrShBpM7f8BXKuMfqCMKHVq6
 SIDctbq4Y/LJxLBjktCKIxa7WEneLrs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270055

The following changes since commit 01205307636157a12c29e6a774bf83b218732050:

   Merge branch 'sa8775p-fix-sig' into 'main' (2026-08-25 22:03:45 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-nordhpass2

for you to fetch changes up to 83a3c7a3b3c770359a384eede4bd46855922817e:

   qcom: add HPASS firmware for nord platform (2026-08-27 12:20:10 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: add HPASS firmware for nord platform

  WHENCE                  |   8 ++++++++
  qcom/nord/adsp.mbn      | Bin 0 -> 8950424 bytes
  qcom/nord/adsp1.mbn     | Bin 0 -> 3470272 bytes
  qcom/nord/adsp1_dtb.mbn | Bin 0 -> 73728 bytes
  qcom/nord/adsp1r.jsn    |  22 ++++++++++++++++++++++
  qcom/nord/adsp_dtb.mbn  | Bin 0 -> 85864 bytes
  qcom/nord/adspr.jsn     |  22 ++++++++++++++++++++++
  qcom/nord/adspua.jsn    |  29 +++++++++++++++++++++++++++++
  8 files changed, 81 insertions(+)
  create mode 100644 qcom/nord/adsp.mbn
  create mode 100644 qcom/nord/adsp1.mbn
  create mode 100644 qcom/nord/adsp1_dtb.mbn
  create mode 100644 qcom/nord/adsp1r.jsn
  create mode 100644 qcom/nord/adsp_dtb.mbn
  create mode 100644 qcom/nord/adspr.jsn
  create mode 100644 qcom/nord/adspua.jsn
