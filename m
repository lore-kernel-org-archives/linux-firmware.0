Return-Path: <SRS0=gj+A=H5=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A86CA5FF1
	for <linux-firmware@archiver.kernel.org>; Wed,  7 Oct 2026 13:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D3AD1F0089C; Wed,  7 Oct 2026 13:53:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791381187;
	b=iTb2Pr6jrqHvugcTG88ttd4ljfqYSTwVoxQeJANABrxXbMb5K2iOvy6tLAd+97bPWUy3
	 POSRYaHR++75YFeLrYx7QOQWruKjN4ulV8wWzAz+r6Zb++vD9bmgCJypQl6OhlT8iY1WC
	 pBgMIKysiXerJoCIlz96WqlEJVSMnS9+iuT9YrG/oRQ3fOAHWoLQpMseBnczC2qt1nI/k
	 NRd+IVRqs54PLdID0DsnejFze4sSBjmBzn5Th83y8DiIXThqIhXMuuZy5SXlKM7PrNuud
	 UgxZ77FAzJ2JSv4PZy4arjHfVtwN3x13ppW5sxW3HMZi/3fPfCIXkokfA+DYh1tdL5A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791381187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Content-Language:List-Id:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LD8iqyT/qSiD0nMGtv9kgN7WtrvMoB3FPQbGgjbVK8o=;
	b=0GfBN/XOB70JlHJVZ35Q3PHOqaNDvhkTu57SFiPaBrP6sGDZfqlah2ef9GMj9v+9cKto
	 mc8yWRCvOJZaOuQ0RwlqEsvJlLchAG2eCvMA+difncPrgx0Wl8p2Wn9fwqTi9SXN2DNHh
	 UxJiItPh+sEZuUItSLwkrB6FgFAaqkmzv4vwvw23x3gCreHE3xt/FgNQ4uQzk+7WWIAfY
	 g9xe0gbsiy7aXlJ1BAEuX6kXiVLeNR5wEYAgxkg1eArlfIu5+r4AIK327RB6nhAJoewH4
	 FKRFBa/R3606unEtF1BBHFZ4Zqvg1VSV/9aVmEJqxreEe4ZDqVhy8kbfzkPQp3Mzn+w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mIUFK754;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EPMMNa/j";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 85A451F0089B
	for <linux-firmware@kernel.org>; Wed,  7 Oct 2026 13:53:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mIUFK754;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EPMMNa/j
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 85A451F0089B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVHRC110205
	for <linux-firmware@kernel.org>; Wed, 7 Oct 2026 13:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LD8iqyT/qSiD0nMGtv9kgN
	7WtrvMoB3FPQbGgjbVK8o=; b=mIUFK754Bj6GexgQeWF6koKF+y4z35QTP2B0Lg
	XIESgSqeBaTL/vKPbvpXvIzTuMa8/wnPc1O7oEkNWAGWBusUoY2x4NjwUfxd5hPG
	dqX7H1peh0vIkGuKSolS3pShzhCsAC+X6rmwrbkL4KnAXkFJ8BCfpMkUqnsvxdDi
	cDhoayhowwuHeHJq4mNp5fdwbaynmo+MQ5uwxG1pHQLtgFQJlGUPAAVuhs8hB6Kz
	IdqwBS1WYSJzVUdJU3HrAlEtAjNwTrbe3KHphnNTwoZTeKFO4mG4jJY86F1O3dyM
	DmH5E7DOYjCObdqGGGmNjwZyd6KuM0zxVOEejFppQBLabWrA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrsgeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 07 Oct 2026 13:53:05 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8255327a28fso4368834a34.0
        for <linux-firmware@kernel.org>; Wed, 07 Oct 2026 06:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791381184; x=1791985984; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LD8iqyT/qSiD0nMGtv9kgN7WtrvMoB3FPQbGgjbVK8o=;
        b=EPMMNa/jjHgCSuQddJ1jCFNYZHl8mN4VHMnZRTf/6X0yXnR8B/FlnqJ+TSAA/DXiXO
         gZSyUorrfY8+xdm6Upni9mBETlXS3JLlhoZ/WlQEDTJq8kbp6GYgyi4SKq1Ye4vxANwZ
         Xadz3hN/D6Am9fmz6OsmrtbP9j7Fn9wI2gQAePDT7ERy7mQC0vwgpQ/h6mXVt+R1H7jP
         TlwLR+Ow8B7QoZyJAqX8HbYWVf5/GE8dgAXrb5hXpAy3otHr0fFDno0j1JqmAXxxW5eZ
         WHMgBj/ovoocMGY2fzaRqHrblajkqsFCB11jYd394Z2d6FhlXr51sXZZV+F+tNzbdrVQ
         GzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791381184; x=1791985984;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LD8iqyT/qSiD0nMGtv9kgN7WtrvMoB3FPQbGgjbVK8o=;
        b=Lq/jUnRQCmH3+mUqk1yb0B3w8DVuk40Zrl1P10PCaQ/vNvFcNgpkjx7McefCBY2pML
         HTa3qSxGOD5QaS/tJtBhZcJ1j++Hv7ZJC2iz0uiDUHy2XRhJEFcmB/cF1fCO3AlxEIGk
         ADyTr5UcTdrHPbLw0rLlhlfBY2dB7M+MVtjWGBFhkCmx5UyIQpl+KmQvEVDSQjug5Tyw
         MqnF8c7fQbQq7hCIKynXh8CXQN6Su8uwRmhxkwUZ59/l8CUQZwiZXzFaBdZTSfx1qpoy
         7pKcsv1DMcWwubqd5yzUYPW0kpyo8BllOjlfNXuTzXJiGs7buqCQAJchTP6VgFFyEwOI
         EtYA==
X-Forwarded-Encrypted: i=1; AKwUvBx0yvk9U/s5yvNPEoz+CseZVFrAkiPGUwnv5u+/tNrLiWRRCK1zOfIE7AkzPlWVLYuGcLWCrr8a9N1N7jf8yw==@kernel.org
X-Gm-Message-State: AFuF++kC2HUv54VczSxJKXNqevKmkvC/vhrj8CGzs9lNnQX8CKngmvFO
	N+MsvLc6O1e7gYsgtx35waOD2WOuVQoZII3tTKLAjuO/OuI9MDASxU+a6chMYmPXe0rmOlOPvwM
	q00iD1KAYt2h/ejW6gCrws+vYGYs3XD62LOs8o/+fGhTJ50PINjn8k6skvILy4wC0kCWN0gI=
X-Gm-Gg: AYBFou01AE/tfWW7u+bXynOzW90TrGDleqZRw7W6zFAeN6LeFjaB/2D/rOYgdlC3pwF
	9dGeFevXkIntI6U8a9C5z4t6HdQpqD2tK8sy85nJ4XBWBD78KJYy+eMKboY+c8e7ydGupTF30Y8
	x+IQmT6hHvXLhI0+DlMQOZFmAWJBN9w23vg88FndbFEPQRsd2Ed8JqnJJofHpmPjP39j5t47zVZ
	TrlDVYHzdl+kuSJ//4P1hrh24NOm2g0ucQQkLGxPN0RJI1RjOZXbniNNfhUaBLAQTThVRjg7Fbp
	hnxnRXlJC6Vw/LLvssxXsrn4j0YplsWYWaP/kkD6FI4Bukz+4LWn61upMqT+bnHn2ZrD+vE+qZe
	WaiqtBowbp6wL1/5cv+upIEfnbI7MI2o2kg9yeu6+xMsHmnVb9bJH0oY+1xMIDhc5
X-Received: by 2002:a05:6830:4acc:b0:816:a9dc:6d0f with SMTP id 46e09a7af769-82ad07bf98amr4173915a34.20.1791381184589;
        Wed, 07 Oct 2026 06:53:04 -0700 (PDT)
X-Received: by 2002:a05:6830:4acc:b0:816:a9dc:6d0f with SMTP id 46e09a7af769-82ad07bf98amr4173892a34.20.1791381184058;
        Wed, 07 Oct 2026 06:53:04 -0700 (PDT)
Received: from ?IPV6:2401:4900:889d:5e59:cd64:8619:9f70:560? ([2401:4900:889d:5e59:cd64:8619:9f70:560])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82ad9ef4a8esm2820592a34.1.2026.10.07.06.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 06:53:03 -0700 (PDT)
Message-ID: <c219edbd-beb7-4259-9167-0a0e2168b5bf@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 19:23:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: update HPASS firmware for nord platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac64ec1 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8
 a=ymPzvEbOTSeJWsDjHFkA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: Pnv-Nfi4StOwsr1B00COPCWN9uLj_hbe
X-Proofpoint-GUID: Pnv-Nfi4StOwsr1B00COPCWN9uLj_hbe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1NSBTYWx0ZWRfX9kmcM1gew6Up
 5dVu920s2QFeXf9iv57CGtmS4dM9yUjWwxcYOB/+bIA88xqdDhRR6224Fr4DvRpm1ADHsFIdN7q
 19qGTasA5j3b1cQaxMJc2sSllGvc/qCj70sv+yvztpRyUod76gMSj4qn1Yuo6Ks8MuynmvJlWXT
 eJaGaLGsFmRldM6QOpOeBt+dEcGBE3WMYtPqDt5EuYl/P+YWRNEqEjaRkUIBu2JyoDX92/H+t+5
 nwIwvmSlVCiDBcym5+xH6OCu7dXDt8AikgWWXwOW4rBBbIHYTZWwHprNvSX6CWEk7B6BcO7wHaG
 g+OFF5eDEzcsWXs4CrN6eIWdXGglEWlmylh61q2dc/6fABZz5cneEygSRRlnwzDVYc0AMfAkmHF
 EiScag7LogmD+jtQz23oHpnXvMGLSqj90z2qcdkKskzcLKOEsVe//J2d4k6rOJ8Ss1GriWqtEqu
 HWvdMXYINTm0DHXdc8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1NSBTYWx0ZWRfX8GW2/qEw1P41
 jNuvk+EcmvT0SVml+E2Xia0biBY8LZ650JpJXTDDKy1OmbidsPctyvfE3iBoHvmzmwAtnXyVl8q
 KiUp40ph0mzHhEq2yMlVzFNQ3W5Blzo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070055

The following changes since commit 24247053afda2bab6b4ace42402dbf9f3b1305d6:

   Merge branch 'arch14-8' into 'main' (2026-10-07 12:01:52 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-hpass_new

for you to fetch changes up to 5821af7ef9b4cd96ad1d9f9a11d5041ae4b02594:

   qcom: update HPASS firmware for nord platform (2026-10-07 19:19:58 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: update HPASS firmware for nord platform

  WHENCE                  |   2 +-
  qcom/nord/adsp.mbn      | Bin 8950424 -> 8950424 bytes
  qcom/nord/adsp1.mbn     | Bin 3470272 -> 3470272 bytes
  qcom/nord/adsp1_dtb.mbn | Bin 73728 -> 73728 bytes
  qcom/nord/adsp_dtb.mbn  | Bin 85864 -> 85864 bytes
  5 files changed, 1 insertion(+), 1 deletion(-)
