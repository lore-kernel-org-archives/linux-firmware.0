Return-Path: <SRS0=MhYL=4B=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4578CAC5A7
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Sep 2025 10:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 875B9C4CEF7; Mon, 22 Sep 2025 10:29:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A89E2C4CEF0
	for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 10:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A89E2C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M7TQaG009739
	for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 10:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5SXzUQ4wd1zPkgDrdko9uo1IDhU/IPZ97GWyOlbCymU=; b=lhY/0fqZETwmNvwq
	WQ0CEEmtWNXQHqRIB8mqd7eu9zJTF7BSkJrEsoWBMp2sjQHVMmS7W1n7I/Y5xn8Y
	56GI4zBmQO5v/DzsIcmkh1QzV+tDqUW7TzZ2O4Or5KZa0MB0c3XlzpfEVfGvysnu
	Y0tXxEPgaQ/mVxBls8xjpVc8/9cfoGKmig/QukB7Z3ZFDQapa9qy+GqNysRGgyPK
	AFdU/ugnHKiQZIyoseeCCurbTW7gltTHWHrc9X2bjpWbnCVCQKZXIKJEDnOODPzJ
	L+HGKGXjIhtsz4q8WDZq1zZtgWypGTllcjjCrtSlN/88D2ZUu1wL5t4afajbJhhs
	S1/Q8g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyemnvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 10:29:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32eb18b5529so3888113a91.2
        for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 03:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758536947; x=1759141747;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SXzUQ4wd1zPkgDrdko9uo1IDhU/IPZ97GWyOlbCymU=;
        b=cy8CG2wlFbSydc3Jkle3L1/TAdM5bNzh+hZHTEPSTb2Lzj0MYspLH3bhp7AXvZ+Fpb
         7FMww7eVWq/BLp2jZEIAQImjwDRbk7XBaQcRNoUd86UkNH1RdvtDhkMFg8jhna0s/RWJ
         5qXiXRHwnsIhfmP1zH16wUKzzygIxqRYyeAHzigs4qFMzpelH2qFWuSgkuAXqjVB9HUH
         AGhX9k4Ow9BnDZIq7lF/WzJe38R3b95XdopvuPygIE1x+Sv5xYqvg9eD/ROaRZb/Vvz3
         GHdK0eALb9g+RWFnerD6H1WjU0EdzFNi5MPS1RdW7dL3o6NCueWHObZ6b1FR5YxmSFLt
         AUyw==
X-Gm-Message-State: AOJu0Yxrugsv8HMIh2Ai5IhEYQ+hsKDX1soiSeDYCajDOn1/7x3y/9Op
	76EcDxtYU0gE2SHbCsaRG9AC19GzEeOcmA9s7UYPU1UrtPIuBfI/jPrS69Qlpi/R7ydZ4KG+qRw
	Oo1RNZfCWA9eEP7epm0yea+AF3LMglztZfFy5BBsYXZYLIQudhJlKMXlYAF5h7A8=
X-Gm-Gg: ASbGncvZdVJYYVrL78aKwq5p9DgF0qSKPa0jAY8BqRSD92UrUe0ggco0hYkrlN6nEiE
	Xmv2wQsAqr6AjVNUS7hlwsWr6RY1zH9DDVF2eKJbOH1m2mMH90FYc7luFQtZB2eM3erz0oEQLC4
	Yh4Bxft/O4ugvYLcXfZzQ+4CAGHSN1EdsyKHqLoxD18bbtqwk3pCybT8jDYgznQH4MPe3Z1YhED
	tnU/ctMH/J1eL6W/U5gtlZUDYJh6AxCsrY5qloM+yzFhcD2M5vcz6JKKQkldIJ83TLjUbG5iJpK
	n4BWUf7opB0Q/r9iaIboaP0toM5fkJ9v6g0A8zyRz9e49kt8Z7tyt02YKjCizU/3na6f
X-Received: by 2002:a17:90b:1e53:b0:32e:24cf:e658 with SMTP id 98e67ed59e1d1-33097fd8aefmr15110665a91.3.1758536946648;
        Mon, 22 Sep 2025 03:29:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdUIydgC82YjGA3xHzlZ04sLqVpStORkFI3aWKnXvweNlSH7TFWL0axijEnJRZKP+MM3rZWQ==
X-Received: by 2002:a17:90b:1e53:b0:32e:24cf:e658 with SMTP id 98e67ed59e1d1-33097fd8aefmr15110634a91.3.1758536946109;
        Mon, 22 Sep 2025 03:29:06 -0700 (PDT)
Received: from [10.204.86.37] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed273e51dsm15837080a91.14.2025.09.22.03.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 03:29:05 -0700 (PDT)
Message-ID: <14c359f7-d451-4cb6-9e38-5035566c0a2c@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 15:59:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, bkumar@qti.qualcomm.com,
        ekansh.gupta@oss.qualcomm.com, kssb@qti.qualcomm.com
References: <575b65b7-a9c8-481a-bdaf-bbab39389b62@oss.qualcomm.com>
 <mtdzhkdv7ex76o5gdfw3llz7r2g6yfonzsmvny6gy5wpf2onuo@m7kibf5nhoji>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 xsDNBGi/G3sBDADFuRVyKREhDod8d+uJxADC+IXOVOXP1Qigxt4a5Cx2rOhULbviJfiJWIsQ
 Rzlc4N1GfhTLpeNoqzd7/LAbnpc/jw0cq+f3EWPaIla0lIKthTCtMCkC5af3NyeqM64xHMMI
 W0SsUO1Zyeio970o6YcFCi90a6gNy4+cTLM3fx9wuaO0TBdkh/bsUmGx1RTZqby6Au0wBoyX
 FzDvHUYApShff+C7JNhmCkbMx33Wwt79ELPlCACFO0IH7ZS1gj5VfBOrNl3Pp0VVfQdcngex
 AvFdSiNccPgxdSWxRCPc1DvLKoq0o0ZLXerqnC31xtBpdu2J4hp+snIclks8+RBwBEoRIfql
 buJIFTzBY583dm3Z5kIwfBIRUa5o23kPv3QbbcsvCOjPE2qsyZy54ddIgTlclTwnJ0yMXRaA
 a595R72PdZ7Nz9u45mFJI+VvUQpjym11dqJKxgvoYSQ4NXVqX2xQ5Ap+F9l4p38dhCbbENFe
 h3VmQWcJ3razk/34iYHu0vsAEQEAAc0sVmVua2F0YSBLb3RhIDx2ZW5rYXRhLmtvdGFAb3Nz
 LnF1YWxjb21tLmNvbT7CwQ0EEwEIADcWIQQpVT+myzILz3YmKTNS2xmc7/wUdwUCaL8bfAUJ
 BaOagAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEFLbGZzv/BR38P0MAL7byTdYQ/8/X3yWSduV
 leTR24juRoG8SeKc8HNug7TBdMxLH6zkbqFSs1PsNMRdEUHey+Pp4uB9RCHsDb9IiHecfn73
 uA+CjHyRrnbVM+u3EeCHvt79QacKsZ5SMBfW2FwVRcsg1fozW+e3SM1RjWbIYtU/QVbx8gO/
 mnFTgnrZ5mHgk/DK2zYRbIUG13ZJN5NDbFhDEKbNNeW2OFuJgAnaWw9Ka2XaRC5dFluen7PN
 0E32OEiiUVSiFBT34Of2qNDGWj+GAkN5fvRa9jU4pNSYgQPt6+shaaN18OoZvZStJbe6wInh
 KByf/2tjqGLZ1Gn6T2s1QR1R6VkoyfhjVG4iYjSpdsMEJN25Wa9d7LeGWdRO5V6NpMIw5Y0D
 TMQ9dVW2c/jU+AuLJ2YcUi3D7kWHVu4s565SLaovEPxkGj2u7WQBEZCDGr7QNeITV6vjI+w2
 38SINd7HsH9LMCDnDFCelbbnyTw9yM66Q2VyKud4nGzQ3HhoD7eMkbJKYWG5As7AzQRovxt8
 AQwAvS7iU5Ee+lb9JJ+MFe0JFm8RQllN6wA5yZWoHzG4EfZ0eusLmdEZioHbSST9UBme9HoV
 wTdvKhrrp+EWIX4zAVqH3xXShSnJ7tlsTWf8D6GV4ctHEu2fRRypXJ6GpJDLjtMUYOWM/ho2
 BntduLHo5J3yg3PvgMj9nTDOcwyNKBzhycXxNQk8ExT2AU5YqR8Q2NWF4BOW+Lac/I8QM32/
 IrGqPMwTkcqv3CJMk+RCRxRSsP7ji2g19k9aqFV32jjvvKr8J/BAxLO7di0+ETCq8h3M2/td
 Xc23DCQa5W5grCNHnG3J9lj6PBvG4/WvQQGnP9lLCrEjkInq+YQY5PU0OwsTNBMeaO5Grnmr
 cgQ9GIEGxd51qyZHc2rFDcJai5Q2JpwkihfDuO1MVnaOkrD5odDyAjKr8oJqbu3hFvqUUtTb
 OtM3tODZ+cAJPJ8WkG2DkT6YFKw/6SSEdsg5XOmKA8i7OA6fVwHg7jiHlzXB2kzxqS20JShl
 Y9WJAc8YIcG9ABEBAAHCwPwEGAEIACYWIQQpVT+myzILz3YmKTNS2xmc7/wUdwUCaL8bfAUJ
 BaOagAIbDAAKCRBS2xmc7/wUd3ayDACEHZxA4o7NVyv9z7pdxzSFZ34Tv//HBfyzZPx6b5vV
 OI3PEFT9jSBqwwWVwwLdRoE6vw3dNAuHUa5IoiXkIo7CRtvddLPryPyHwq4+I8uRfn8jNNgD
 4+5weUZvMtGZlxjtV4jXEdRwZuFrlY/p3nyvGFBjkes7pEBExjDuW4ligyYKF7pM+Ndrkw5n
 q7lTD5c8evUv4q2Fs9KCxyaKwAOb1z2s8tO3EeOmGWmhLWgtS4o/rv4hDNfyCji6BjNGFpt1
 5yiRSqo4FJuz+Lr6GEO1sod/MHZF97iUOHDoaOIoeKwX246DwtXL0LQuYqNrq7ryPunmTpOE
 qaXWztaQtxsBJdBKUeEO6/ukSPYTZiTyXZi4M309uDiX5EDXIiimX7Vfzf6qWYln3jtpca7+
 wjt8XHC+OAMMkCkL62+osvHOhazJAS2xCR71LEn81bXxEIs72zc1R7U6Gk2P9K8t3NbaLNBU
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <mtdzhkdv7ex76o5gdfw3llz7r2g6yfonzsmvny6gy5wpf2onuo@m7kibf5nhoji>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nYeV7ZgL9A64-mwynw0A0RVWZ1KvVJCp
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d124f3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=V3l8--UoluJwf4B9EaoA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXz5HekqH25f58
 gzhV/TtY1Jc5JdloUKn7R3moC5l8dPTWgbDXxMKJt1iFuvD7NsT7AP/9vS7/r0ozgcmxltegq5i
 mMNO9CD6smQcYt/q3ExqQw47gvDiVMpR/3348EN8j3nxH3lcGRz5Rb2VvTy/slXeZB8ACBGa+Bx
 wyA9fmwREX+dzoKSk7qCivMyXoR/BQAUkVwqMk/I8WgtdNP/s82HCvzm57GL35oq7afnS9d7hGP
 ELuNkk1hHnb3nL91cEgbBODTycDY9kmU9ICHULRZnPpW9SC5w3LqlcIS9NJm5k5oHtmABiCV6TU
 kqpmQsfrkkHQAhJeFeHgTQkDbGlVesyT6UeshFOaBVjeksCiPl+BUMq7Hll2w6a5BFrSyavgZ2k
 r1w6mJnd
X-Proofpoint-ORIG-GUID: nYeV7ZgL9A64-mwynw0A0RVWZ1KvVJCp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004



On 9/22/2025 3:49 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 22, 2025 at 03:39:54PM +0530, Venkata Kota wrote:
>> The following changes since commit 493de17dee9901605e69ad804815cd7408d84547:
>>
>>    Merge branch 'robot/pr-0-1758303798' into 'main' (2025-09-19 18:33:44
>> +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-qcs8300-dspmon-125
>>
>> for you to fetch changes up to 704b227a99683715bc8f3fb514bc6b9d18372f28:
>>
>>    qcom: Update DSP firmware for qcs8300 platform. (2025-09-22 15:30:25
>> +0530)
> 
> This commit isn't present inside the branch.
I see them now. Please check.>>
>> ----------------------------------------------------------------
>> Venkata Kota (1):
>>        qcom: Update DSP firmware for qcs8300 platform.
>>
>>   WHENCE                  |   6 +++---
>>   qcom/qcs8300/adsp.mbn   | Bin 6643712 -> 6684672 bytes
>>   qcom/qcs8300/cdsp0.mbn  | Bin 3084288 -> 3080192 bytes
>>   qcom/qcs8300/gpdsp0.mbn | Bin 5832704 -> 5873664 bytes
>>   4 files changed, 3 insertions(+), 3 deletions(-)
>>
> 

